{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
  outputs = { nixpkgs, ... }:
  let
    pkgs = nixpkgs.legacyPackages.aarch64-darwin;
  in {
    devShell.aarch64-darwin = pkgs.mkShell {
      	name = "k8s";
      	packages = with pkgs; [
          k9s
          kustomize
          kubectl
        ];
        shellHook = ''
          echo -e "\e[1;94m == Development Environment =="
          # add --version or some other call to list dev packages
          k9s version
      		kustomize version
      		kubectl version
          echo -e "\e[0m"
        '';
      };
    }
  ;
}
