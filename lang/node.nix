{ pkgs }:

pkgs.mkShell {
  name = "nodejs-22-devshell";
  buildInputs = with pkgs; [ 
    nodejs_22 pnpm yarn 
  ];
  shellHook = ''
    echo "Node.js version: $(node --version)"
  '';
}
