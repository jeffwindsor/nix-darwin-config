{ config, lib, pkgs, ... }:{
  
  # mkEnableOption is mkOption of bool, defaulted to false
  #   https://github.com/NixOS/nixpkgs/blob/master/lib/options.nix?plain=1#L182
  options.bundles.modern-cli-tools.enable = lib.mkEnableOption "modern-cli-tools";

  config = lib.mkIf config.bundles.modern-cli-tools.enable {
    
    environment.systemPackages = with pkgs; [
      bat  # cat replacement
      eza  # ls replacement
      fd  # find replacement
      fzf  # fuzzy finder
      ripgrep  #grep replacement
      sd  # sed replacement
      starship # prompt
      uutil # rust replacement for GNU tools
      yazi  # tui file manager
    ];
    
    packages.television.enable = true;
  };
}
