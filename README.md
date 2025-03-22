## Helpful Commands

```bash
export NIXCONFIG='/your/path/to/flake
```

### macOS (darwin)

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
