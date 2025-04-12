{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
  outputs = { nixpkgs, ... }:
  let
    pkgs = nixpkgs.legacyPackages.aarch64-darwin;
  in {
    devShell.aarch64-darwin = pkgs.mkShell {
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
  ;
}
