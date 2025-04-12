{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
  outputs = { nixpkgs, ... }:
  let
    pkgs = nixpkgs.legacyPackages.aarch64-darwin;
  in {
    devShell.aarch64-darwin = pkgs.mkShell {
        name = "Load-testing";
        packages = with pkgs; [
          vegeta   # Versatile HTTP load testing tool
          k6       # Modern load testing tool,
        ];
        
        shellHook = ''
          echo -e "\e[1;94m == Development Environment =="
          vegeta --version
          k6 --version
          echo -e "\e[0m"
        '';
      };
    }
  ;
}
