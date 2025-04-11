#!/usr/bin/env bash

package_name="$1"
filepath="$(dirname "$0")/${package_name}.nix"

# read template.nix
cat package-template.nix | sed \
 -e "s/{package_name}/$package_name/g" \
> "$filepath"
