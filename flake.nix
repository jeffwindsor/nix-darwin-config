{
  description = "jeff.windsor";

  inputs = {
    # Nix Modules: General: https://nixos.org/manual/nixpkgs/unstable/#sec-config-options-reference
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    
    # Nix Modules: MacOs : https://daiderd.com/nix-darwin/manual/index.html
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # exposes gui apps to spotlight and the dock
    mac-app-util.url = "github:hraban/mac-app-util";

    # manages Homebrew installations on macOS using nix-darwin
    # nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    nix-homebrew.url = "git+https://github.com/zhaofengli/nix-homebrew?ref=refs/pull/71/merge"; # temp fix for homebrew bundle deprication (Mar 2025)
    homebrew-core = { url = "github:homebrew/homebrew-core"; flake = false; };
    homebrew-cask = { url = "github:homebrew/homebrew-cask"; flake = false; };
    homebrew-bundle = { url = "github:homebrew/homebrew-bundle"; flake = false; };
    
  };

  outputs = inputs:
  let
    ds = inputs.nix-darwin.lib.darwinSystem;
    ns = inputs.lib.nixosSystem;
    mac-app = inputs.mac-app-util.darwinModules.default;
    
    brew = inputs.nix-homebrew.darwinModules.nix-homebrew;
    brew_attributes = user: {
      nix-homebrew = {
        user = user;
        enable = true;
        enableRosetta = true;
        taps = {
          "homebrew/homebrew-core" = inputs.homebrew-core;
          "homebrew/homebrew-cask" = inputs.homebrew-cask;
          "homebrew/homebrew-bundle" = inputs.homebrew-bundle;
        };
        mutableTaps = false;
      };
    };

  in
  {
    # personal linux laptop
    nixosConfigurations."framework" = ns {
      modules = [
        ./machine/framework13.nix
        ./desktop/gnome.nix
        ./packages/default.nix
      ];
    };

    # personal M2
    darwinConfigurations."Midnight-Air" = ds {
      modules = [
        ./machine/macbook_m.nix
        ./desktop/aqua.nix 
        ./packages {
          bundles.personal.enable = true;
        }
        brew (brew_attributes "jeffwindsor")
        mac-app
      ];
    };

    # work M4
    darwinConfigurations."WKMZTAFD6544" = ds {
      modules = [
        ./machine/macbook_m.nix 
        ./desktop/aqua.nix 
        ./packages {
          bundles.cj.enable = true;
          packages.google-chrome = true;
        }
        brew (brew_attributes "jefwinds")
        mac-app
      ];
    };
    
  };
}
