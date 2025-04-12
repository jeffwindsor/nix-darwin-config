{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
  outputs = { nixpkgs, ... }:
  let
    pkgs = nixpkgs.legacyPackages.aarch64-darwin;
  in {
    devShell.aarch64-darwin = pkgs.mkShell {
      	name = "python 3.12";
        
      	packages = with pkgs; [
          (python312.withPackages(p: with p; [ python-lsp-server black pytest ]))

          # for scripts
          bash-language-server
          shellcheck
          shfmt
      	];

       	shellHook = ''
          echo -e "\e[1;94m == Python Development Environment =="
          python --version
          pylsp --version
          pytest --version
          echo -e "\e[0m"
      	'';
      };
    }
  ;
}
