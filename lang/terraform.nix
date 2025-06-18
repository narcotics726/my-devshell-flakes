{ pkgs }:

pkgs.mkShell {
  name = "terraform-devshell";
  buildInputs = [ pkgs.terraform ];
  shellHook = ''
    echo "Terraform version: $(terraform version | head -n 1)"
  '';
}
