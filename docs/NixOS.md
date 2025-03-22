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
