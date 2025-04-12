{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
  outputs = { nixpkgs, ... }:
  let
    pkgs = nixpkgs.legacyPackages.aarch64-darwin;
  in {
    devShell.aarch64-darwin = pkgs.mkShell {
    	name = "dotfiles";
    	packages = with pkgs; [
        nixd
        bash-language-server
        shellcheck
        shfmt
        # taplo  #TOML
        # yaml-language-server
    	];
      shellHook = ''
        echo -e "\e[1;94m == Nix/Toml/Bash Development Environment =="
      	nixd --version
        taplo --version
        # shellcheck --version
        echo -e "bash-language-server $(bash-language-server --version)"
    		echo -e "\e[0m"
      '';
    };
  };
}
