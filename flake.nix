{
  description = "❄ jeff.windsor's nix flake ❄";

  # Define the inputs to the flake "function"
  inputs = {
    # Nix Modules: General: man-page: https://nixos.org/manual/nixpkgs/unstable/#sec-config-options-reference
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    
    # Nix Modules: MacOs: man-page: https://daiderd.com/nix-darwin/manual/index.html
    #   pin to nix packages version
    nix-darwin = { url = "github:LnL7/nix-darwin"; inputs.nixpkgs.follows = "nixpkgs"; };

    # Exposes gui apps to spotlight and the dock by creating a folder in applications it maintains
    mac-app-util.url = "github:hraban/mac-app-util";

    # Installs Homebrew on macOS using nix-darwin, so it can be used in the terminal and provide packages in this flake
    # nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    nix-homebrew.url = "git+https://github.com/zhaofengli/nix-homebrew?ref=refs/pull/71/merge"; # temp fix for homebrew bundle deprication (Mar 2025)
    homebrew-core = { url = "github:homebrew/homebrew-core"; flake = false; };
    homebrew-cask = { url = "github:homebrew/homebrew-cask"; flake = false; };
    homebrew-bundle = { url = "github:homebrew/homebrew-bundle"; flake = false; };
    
  };

  # Define the results returned from the flake "function"
  outputs = inputs:
  let
    # variables for brevity
    ds = inputs.nix-darwin.lib.darwinSystem;
    ns = inputs.lib.nixosSystem;
    mac-app = inputs.mac-app-util.darwinModules.default;
    homebrew = inputs.nix-homebrew.darwinModules.nix-homebrew;

    # function: returns attributes for a user
    for_user = user: {
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
        ./packages # minimum viable set of packages
      ];
    };

    # personal M2
    darwinConfigurations."Midnight-Air" = ds {
      modules = [
        ./machine/macbook_m.nix
        ./desktop/aqua.nix 
        ./packages { bundles.personal = true; }
        homebrew (for_user "jeffwindsor")
        mac-app
      ];
    };

    # work M4
    darwinConfigurations."WKMZTAFD6544" = ds {
      modules = [
        ./machine/macbook_m.nix 
        ./desktop/aqua.nix 
        ./packages { bundles.cj = true; }
        homebrew (for_user "jefwinds")
        mac-app
      ];
    };
    
  };
}
