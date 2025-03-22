# NixOs and Darwin Config

## Notes

* I have tried to follow the standard nix package approach to modules.
  * `Default.nix` files are built to import `nix` files in the directory
  * Other `nix` files will set a config enable option
  * Bundles are just groups of packages for a purpose
  * This approach sacrifices terseness for flexibilty
  * Relies on config options to enable software
* Importing a directory imports the `directory/default.nix`
* macOS is the darwin kernel with the aqua desktop

## Commands

```bash
export NIXCONFIG="/path/to/flake"
```

### macOS

```bash
alias clean="nix store gc"
alias generations="darwin-rebuild --list-generations"
alias rebuild="darwin-rebuild build --impure --flake \$NIXCONFIG"
alias switch="darwin-rebuild switch --impure --flake \$NIXCONFIG"
alias update="nix flake update --flake \$NIXCONFIG"
alias optimise="nix store optimise"
alias doctor="nix-store --verify --check-contents --repair"
```

### NixOS

```bash
alias clean="nix-env --delete-generations +5 && nix-collect-garbage"
alias generations="sudo nix-env --list-generations --profile /nix/var/nix/profiles/system"
alias rebuild="nixos-rebuild build --impure --flake \$NIXCONFIG"
alias switch="nixos-rebuild switch --impure --flake \$NIXCONFIG"
alias upgrade="nixos-rebuild switch --upgrade --impure --flake \$NIXCONFIG"
alias optimise="nix store optimise"
alias doctor="nix-store --verify --check-contents --repair"
```
