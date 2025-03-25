{ pkgs, ... }: {

  imports = [
    ./cj.nix
    ./personal.nix
    ./modern-cli-tools.nix
  ];
}
