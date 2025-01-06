{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    calias.url = "github:deemp/alias-c";
    qalias.url = "github:deemp/qalias";
  };

  outputs =
    inputs:
    inputs.flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = inputs.nixpkgs.legacyPackages.${system};
        calias = inputs.calias.packages.${system}.calias;
        qalias = inputs.qalias.packages.${system}.qalias;
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            calias
            qalias
            pkgs.nasm
          ];
          shellHook = ''
            export ALTLIB="${calias}/build/altlib_ext"
          '';
        };
      }
    );
}
