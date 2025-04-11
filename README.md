
# Configuration Paths
* [macOS](#macos)
* [NixOS](#nixos)

## Notes

* `Default.nix` files are built to import `nix` files in the directory
* Top level `nix` files or bundles will set enable options for imported modules
* Bundles are just groups of packages for a purpose
* This approach sacrifices terseness for flexibilty
* Relies on config options to enable software
* Importing a directory imports the `directory/default.nix`
* macOS is the darwin kernel with the aqua desktop

# NixOS

a work in progress

## Optional Aliases
* `NIX_FLAKE_PATH` is optional but helpful.
* Tip: NIX_CONFIG is used by NIX for other purposes, so don't use it
* `search` input is regex. Example search for Firefox or Chromium: "firefox|chromium"
```sh
export NIX_FLAKE_PATH="/path/to/flake"

alias clean="echo 'garbage collecting: this might take a while' && nix store gc"
alias generations="sudo nix-env --list-generations --profile /nix/var/nix/profiles/system"
alias optimise="echo 'optimising: this might take a while' && nix store optimise"
alias rebuild="nixos-rebuild build --impure --flake \$NIX_FLAKE_PATH"
alias search="nix search nixpkgs"
alias switch="nixos-rebuild switch --impure --flake \$NIX_FLAKE_PATH"
alias upgrade="nixos-rebuild switch --upgrade --impure --flake \$NIX_FLAKE_PATH"
```


# macOS

## Install

1. [Nix](https://nixos.org/download/)
1. [Nix-Darwin](https://github.com/LnL7/nix-darwin?tab=readme-ov-file#step-2-installing-nix-darwin) 
    * [Optional: create a clean flake](https://github.com/LnL7/nix-darwin?tab=readme-ov-file#step-2-installing-nix-darwin)

## Optional Nix Config Files
These files set reasonable defaults for using nix, such as allowing "un-free" software and enableingthe use of `flakes`

### ~/.config/nix/nix.conf

```sh
# nix-command: enables the new nix subcommands
# flakes: enables the use of flakes
# pipe-operators: Add |> and <| operators to the Nix language.
experimental-features = nix-command flakes pipe-operators

```

* [nix.conf](https://nix.dev/manual/nix/latest/command-ref/conf-file)
* [experimental-features](https://nix.dev/manual/nix/latest/development/experimental-features)
* [nix command reference](https://nix.dev/manual/nix/latest/command-ref/new-cli/nix)


### ~/.config/nixpkgs/config.nix
```sh
{
  allowUnfree = true;  # all unfree packages allowed
  # == allowUnfree alternative ==
  # allowUnfreePredicate = pkg: {
  #    some logic to filter which packages can be unfree or not  
  #    returns a bool
  # };
}
```
* [allowUnfree](https://nixos.wiki/wiki/Unfree_Software)


## Optional Aliases
I use these aliases to support my use of nix on a mac, for example using NIX_FLAKE_PATH to point to you config repo instead of base config
* `NIX_FLAKE_PATH` is optional but helpful.
* Tip: NIX_CONFIG is used by NIX for other purposes, so don't use it
* `search` input is regex. Example search for Firefox or Chromium: "firefox|chromium"
```sh
export NIX_FLAKE_PATH="/path/to/flake"

alias clean="echo 'garbage collecting: this might take a while' && nix store gc"
alias generations="darwin-rebuild --list-generations"
alias optimise="echo 'optimising: this might take a while' && nix store optimise"
alias rebuild="darwin-rebuild build --impure --flake \$NIX_FLAKE_PATH"
alias search="nix search nixpkgs"
alias switch="darwin-rebuild switch --impure --flake \$NIX_FLAKE_PATH"
alias update="nix flake update --flake \$NIX_FLAKE_PATH"
```

