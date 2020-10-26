{ pkgs ? import ../nix/nixpkgs.nix, compiler ? "ghc884", hoogle ? true }:

let
  src = ./.;

  compiler' = if compiler != null then
    compiler
  else
    "ghc" + pkgs.lib.concatStrings
    (pkgs.lib.splitVersion pkgs.haskellPackages.ghc.version);

  # Any overrides we require to the specified haskell package set
  haskellPackages = with pkgs.haskell.lib;
    pkgs.haskell.packages.${compiler'}.override {
      overrides = self: super:
        import ../nix/haskell-packages.nix { inherit pkgs hoogle; } self super
        // {
          vulkan = let
            srcFilter = path: _type:
              (baseNameOf path == "package.yaml")
              || pkgs.lib.hasInfix "/src" path;
          in doHaddock (disableLibraryProfiling (self.callCabal2nix "vulkan"
            (builtins.filterSource srcFilter ../.) {
              vulkan = pkgs.vulkan-loader;
            }));
          vulkan-utils = addExtraLibrary (doHaddock
            (disableLibraryProfiling (self.callCabal2nix "" ../utils { })))
            pkgs.vulkan-headers;
          VulkanMemoryAllocator = addExtraLibrary (doHaddock
            (disableLibraryProfiling
              (self.callCabal2nix "" ../VulkanMemoryAllocator { })))
            pkgs.vulkan-headers;
        };
    };

  # Any packages to appear in the environment provisioned by nix-shell
  extraEnvPackages = with pkgs; [ vulkan-validation-layers ];

  # Generate a haskell derivation using the cabal2nix tool on `package.yaml`
  drv = let
    fixes = drv:
      with pkgs.haskell.lib;
      addExtraLibrary (addBuildTool drv pkgs.glslang) pkgs.renderdoc;
    old = fixes
      (haskellPackages.callCabal2nixWithOptions "" src "--flag=renderdoc" { });
  in old // {
    # Insert the extra environment packages into the environment generated by
    # cabal2nix
    env = pkgs.lib.overrideDerivation old.env
      (attrs: { buildInputs = attrs.buildInputs ++ extraEnvPackages; });
  };

in if pkgs.lib.inNixShell then drv.env else drv
