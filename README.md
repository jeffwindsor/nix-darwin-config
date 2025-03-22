
# Configuration Paths
* [macOS](./docs/macOS.md)
* [NixOS](./docs/NixOS.md)

# Notes

* `Default.nix` files are built to import `nix` files in the directory
* Top level `nix` files or bundles will set enable options for imported modules
* Bundles are just groups of packages for a purpose
* This approach sacrifices terseness for flexibilty
* Relies on config options to enable software
* Importing a directory imports the `directory/default.nix`
* macOS is the darwin kernel with the aqua desktop

