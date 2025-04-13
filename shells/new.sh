#!/usr/bin/env bash
shell_name="$1"

# create sub directory
mkdir -p "./$shell_name"

# read template.nix
# 1. replace placeholders with values
# 2. remove all comment lines
# 3. put result in the new directory as flake.nix
cat "$(dirname "$0")/shell-flake-template.nix" | sed \
	-e "s/{shell_name}/$shell_name/g" \
	-e '/^ *#/d' \
	>"./$shell_name/flake.nix"
