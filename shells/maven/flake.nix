{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, utils, ... }: utils.lib.eachDefaultSystem (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShell = pkgs.mkShell {
      	name = "maven";
        packages = with pkgs; [
          maven
        ];
        shellHook = ''
          echo -e "\e[1;94m == maven development shell  =="
          mvn --version
          echo -e "\e[0m"
        '';
      };
    }
  );
}
