let
  nixpkgsSrc = builtins.fetchTarball {
    url =
      "https://github.com/expipiplus1/nixpkgs/archive/6ab954928a3dff2482e7ed7f315b0b0b43007a57.tar.gz"; # refs/heads/joe-vulkan
    sha256 = "19fr9hzrqpldn85fy0ns71pgs6yzwk4wqhryks299xbzqva9jlay";
  };

in import nixpkgsSrc { }
