{
  description = "Nix-Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    mac-app-util.url = "github:hraban/mac-app-util";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, mac-app-util, nix-homebrew }:
  let
    configuration = { pkgs, config, ... }: {

      nixpkgs.config.allowUnFree = true;      
      
      # Packages installed in system profile (for all users)
      environment.systemPackages = with pkgs;
        [
          # GUIs
          aerospace
          
          # Shells
          bash
          nushell
          zsh

          # CLIs
          bat
          eza
          fzf
          git
          ripgrep
          starship
          stow

          # TUIs
          helix
          lazygit
          yazi

          # language servers for EDITOR
          bash-language-server
          shellcheck
          shfmt
          yaml-language-server

        ];

      homebrew = {
        enable = true;
        
        # GUIs
        casks = [
          "alacritty"
          "balenaetcher"
          "chatgpt"
          "firefox"
          "google-chrome"
          "iina"
          "keepingyouawake"
          "pearcleaner"
          "slack"
          "spotify"
          "sweet-home3d"

          "font-jetbrains-mono-nerd-font"
        ];
        
        # all brew installs outside of nix will be removed / "zapped"
        onActivation.cleanup = "zap";
    
      };

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      programs.zsh.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."Midnight-Air" = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
        # handles spotlight and dock aliasing of applications
        mac-app-util.darwinModules.default
        # handles installing homebrew and mas(applestore)
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            # Install Homebrew under the default prefix
            enable = true;

            # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
            enableRosetta = true;

            # User owning the Homebrew prefix
            user = "jeffwindsor";

            # Automatically migrate existing Homebrew installations
            autoMigrate = true;
          };
        }
       ];
    };
  };
}
