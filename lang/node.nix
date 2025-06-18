{ pkgs }:

pkgs.mkShell {
  name = "nodejs-22-devshell";
  buildInputs = [ pkgs.nodejs_22 pkgs.pnpm pkgs.yarn ];
  shellHook = ''
    echo "Node.js version: $(node --version)"
  '';
}
