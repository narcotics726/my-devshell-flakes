{ pkgs }:

pkgs.mkShell {
  name = "rust-devshell";
  buildInputs = [ pkgs.rustc pkgs.cargo pkgs.rustfmt pkgs.clippy ];
  shellHook = ''
    echo "Rust version: $(rustc --version)"
  '';
}
