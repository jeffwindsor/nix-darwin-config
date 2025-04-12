{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
  outputs = { nixpkgs, ... }:
  let
    pkgs = nixpkgs.legacyPackages.aarch64-darwin;
  in {
    devShell.aarch64-darwin = pkgs.mkShell {
    	name = "AWS";
      packages = with pkgs; [
        awscli2
        nodePackages.aws-cdk
      ];
      shellHook = ''
        echo -e "\e[1;94m == Development Environment =="
        # add --version or some other call to list dev packages
        echo -e "https://operations.cj.dev/"
        aws --version
        cdk --version
        echo -e "\e[0m"
      '';
    };
  };
}
