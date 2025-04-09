{ config, lib, pkgs, ... }:{

  options.packages.modern-cli-tools.enable = lib.mkEnableOption "modern-cli-tools";

  config = lib.mkIf config.packages.modern-cli-tools.enable {
    
    environment.systemPackages = with pkgs; [
      bat  # cat replacement
      eza  # ls replacement
      fd  # find replacement
      fzf  # fuzzy finder
      ripgrep  #grep replacement
      sd  # sed replacement
      starship  # prompt
      # uutils-coreutils-noprefix # rust replacement for GNU tools
      yazi  # tui file manager
    ];
    
    packages.television.enable = true;
  };
}
