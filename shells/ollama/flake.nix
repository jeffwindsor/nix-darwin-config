{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
  outputs = { nixpkgs, ... }:
  let
    pkgs = nixpkgs.legacyPackages.aarch64-darwin;
  in {
    devShell.aarch64-darwin = pkgs.mkShell {
      	name = "ollama";
        packages = with pkgs; [
          ollama
        ];
        shellHook = ''
        	function ollama-select-run() {
        		local selection
        		selection=$(ollama list | tail -n +2 | cut -d':' -f1 | fzf)
        		[[ -n $selection ]] && ollama run $selection
        	}

          alias or="ollama-select-run"
          alias os="ollama serve"
          alias op="ollama ps"
        
          echo -e "\e[1;94m == ollama nix shell =="
          ollama --version
          echo -e "\e[0m"

          alias | grep "ollama"
          
        '';
      };
    }
  ;
}
