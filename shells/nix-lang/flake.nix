{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
  outputs = { nixpkgs, ... }:
  let
    pkgs = nixpkgs.legacyPackages.aarch64-darwin;
  in {
    devShell.aarch64-darwin = pkgs.mkShell {
      	name = "nix";
      	packages = with pkgs; [ nixd ];

        # shellHook (default: ""). Bash statements that are executed by nix-shell.
        shellHook = ''
          echo -e "\e[1;94m == Nix Development Environment =="
        	nixd --version
      		echo -e "\e[0m"

        '';
      };
    }
  ;
}
