{
  description = "Collection of kinds of devshell";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      unfree-pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
      };
    in {
      devShells.${system} = {
        node22 = import ./lang/node.nix { inherit pkgs; };
        rust = import ./lang/rust.nix { inherit pkgs; };
        terraform = import ./lang/terraform.nix { pkgs = unfree-pkgs; };
      };
    };
}
