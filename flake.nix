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
          direnv
          nix-direnv
          eza
          fzf
          git
          mas
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

        # Homebrew GUIs 
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

        # Mac App Store (mas)
        masApps = {
          "DaisyDisk" = 411643860;
          "Amazon Prime Video" = 545519333;
        };
        
        # all brew installs outside of nix will be removed / "zapped"
        onActivation = {
          cleanup = "zap";
          autoUpdate = true;
          upgrade = true;
        };
      };

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";
      
      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      # Enable alternative shell support in nix-darwin.
      programs.zsh.enable = true;

      system = {
        # Set Git commit hash for darwin-version.
        configurationRevision = self.rev or self.dirtyRev or null;

        # MacOs settings
        defaults = {
          dock = {
            autohide = true;
            # remove delay for showing dock
            autohide-delay = 0.0;
            largesize = 128;
            launchanim = false;            # Animate Opening Applications
            magnification = true;
            orientation = "right";
            show-recents = false;
          };
          
          finder = {
            AppleShowAllExtensions = true;
            AppleShowAllFiles = true;
            FXDefaultSearchScope = "SCcf";      # Search Targets Current Folder
            ShowPathbar = true;
            _FXShowPosixPathInTitle = true;
            _FXSortFoldersFirstOnDesktop = true;
          };

          loginwindow.GuestEnabled = false;

          NSGlobalDomain.AppleInterfaceStyle = "Dark";
        };
        
        # Used for backwards compatibility, please read the changelog before changing.
        # $ darwin-rebuild changelog
        stateVersion = 5;
      };

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
