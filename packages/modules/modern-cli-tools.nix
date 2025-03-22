{ config, lib, pkgs, ... }:{
  
  # mkEnableOption is mkOption of bool, defaulted to false
  #   https://github.com/NixOS/nixpkgs/blob/master/lib/options.nix?plain=1#L182
  options.packages.modern-cli-tools = lib.mkEnableOption "modern-cli-tools";

  config = lib.mkIf config.packages.modern-cli-tools {
    environment.systemPackages = with pkgs; [
      bat  # cat replacement
      eza  # ls replacement
      fd  # find replacement
      fzf  # fuzzy finder
      ripgrep  #grep replacement
      sd  # sed replacement
      starship # prompt
      yazi  # tui file manager
    ];
  };
}
