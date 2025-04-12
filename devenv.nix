{ pkgs, ... }: {
  packages = with pkgs; [
    nil
    shellcheck
    # yamlfmt
    # taplo
  ];

  languages = {
    nix.enable = true;
    shell.enable = true;
  };

  git-hooks.hooks = {
    nixfmt-classic.enable = true;
    shellcheck.enable = true;
    # taplo.enable = true;
  };

  # See full reference at https://devenv.sh/reference/options/
}
