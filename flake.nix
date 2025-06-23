{
  description = "Collection of kinds of devshell";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-darwin" ];
      forAllSystems = f: nixpkgs.lib.genAttrs supportedSystems (system:
        let
          pkgs = import nixpkgs { inherit system; };
          unfree-pkgs = import nixpkgs {
            inherit system;
            config = { allowUnfree = true; };
          };
        in f { inherit pkgs unfree-pkgs system; }
      );
    in {
      devShells = forAllSystems ({ pkgs, unfree-pkgs, system }: {
        node = import ./lang/node.nix { inherit pkgs; };
        rust = import ./lang/rust.nix { inherit pkgs; };
        terraform = import ./lang/terraform.nix { pkgs = unfree-pkgs; };
      });
    };
}
