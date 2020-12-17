let
  nixpkgsSrc = builtins.fetchTarball {
    url =
      "https://github.com/expipiplus1/nixpkgs/archive/42743be017ebf846435789f24877304de396d954.tar.gz"; # refs/heads/joe-vulkan-2
    sha256 = "1wav7k5g9dyh7hsin2v5vvj9sjnwqb5wz2k540pw57szz5zbjc7q";
  };

in import nixpkgsSrc { }
