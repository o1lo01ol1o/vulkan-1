let
  nixpkgsSrc = builtins.fetchTarball {
    url =
      "https://github.com/expipiplus1/nixpkgs/archive/3fac5c23fbd06b972f532093d24881f506d257f2.tar.gz"; # refs/heads/joe-vulkan
    sha256 = "0z23s6fhcfqq2yzmjr7fyhrhyklv4w0ivzxcs9bjl74d2m5rx7yq";
  };

in import nixpkgsSrc { }
