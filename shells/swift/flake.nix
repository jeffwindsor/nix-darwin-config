{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
  outputs = { nixpkgs, ... }:
  let
    pkgs = nixpkgs.legacyPackages.aarch64-darwin;
  in {
    devShell.aarch64-darwin = pkgs.mkShell {
    	name = "swift";
      packages = with pkgs; [
        sourcekit-lsp
      ];
      shellHook = ''
        echo -e "\e[1;94m == swift shell  =="
        echo -e "\e[0m"
      '';
    };
  };
}
