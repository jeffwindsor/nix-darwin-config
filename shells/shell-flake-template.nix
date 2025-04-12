{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
  outputs = { nixpkgs, ... }:
  let
    pkgs = nixpkgs.legacyPackages.aarch64-darwin;
  in {
    devShell.aarch64-darwin = pkgs.mkShell {
    	name = "{shell_name}";
      packages = with pkgs; [ ];
      shellHook = ''
        echo -e "\e[1;94m == {shell_name} shell  =="
        # pkg --version
        echo -e "\e[0m"
      '';
    };
  };
}
