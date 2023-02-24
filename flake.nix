{
  description = "Generates the contents for cacrawford.org using Hugo.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        apps = {
          hugo = flake-utils.lib.mkApp { drv = pkgs.hugo; };
        };
        packages = {
          default = pkgs.callPackage ./default.nix { };
        };
      }
    );
}
