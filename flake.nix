{
  description = "❄ jeff's os flake ❄";

  # Define the inputs to the flake "function"
  inputs = {
    # Nix Modules: https://nixos.org/manual/nixpkgs/unstable/#sec-config-options-reference
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    
    # Nix Modules (macOs): https://daiderd.com/nix-darwin/manual/index.html
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-24.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  # Define the results returned from the flake "function"
  outputs = inputs:
  let
    ds = inputs.nix-darwin.lib.darwinSystem;
    ns = inputs.lib.nixosSystem;
  in
  {
    # personal M2
    darwinConfigurations."Midnight-Air" = ds {
      modules = [
        ./machine/macbook_m.nix
        ./desktop/aqua.nix 
      ];
    };

    # work M4
    darwinConfigurations."WKMZTAFD6544" = ds {
      modules = [
        ./machine/macbook_m.nix 
        ./desktop/aqua.nix
      ];
    };
    
    # personal linux laptop
    nixosConfigurations."frame" = ns {
      # Work in Progress
      modules = [
        ./machine/framework13.nix
        ./desktop/gnome.nix
        ./packages
        {
          config.packages = {
            # guis
            chatgpt.enable = true;
            firefox.enable = true;
            google-chrome.enable = true;
            nyxt.enable = true;
            spotify.enable = true;
            zed-editor.enable = true;
            # clis / tuis
            git.enable = true;
            helix.enable = true;
            modern-cli-tools.enable = true;      
            mono-fonts.enable = true;
            network-utils.enable = true;
            nushell.enable = true;
            zsh.enable = true;
          };
        }
      ];
    };
  };

}
