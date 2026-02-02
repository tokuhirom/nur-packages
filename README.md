# nur-packages

**My personal [NUR](https://github.com/nix-community/NUR) repository**

![Build and populate cache](https://github.com/tokuhirom/nur-packages/workflows/Build%20and%20populate%20cache/badge.svg)

## Packages

| Package | Description |
|---------|-------------|
| `apprun-dedicated-provisioner` | CLI tool for managing SAKURA Cloud AppRun Dedicated application provisioning |
| `dashyard` | Lightweight Prometheus metrics dashboard |

## Usage

### With devbox

Add to your `devbox.json`:

```json
{
  "packages": [
    "github:tokuhirom/nur-packages#apprun-dedicated-provisioner"
  ]
}
```

To pin a specific version, use a commit hash:

```json
{
  "packages": [
    "github:tokuhirom/nur-packages/<commit-hash>#apprun-dedicated-provisioner"
  ]
}
```

### With Nix Flakes

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    tokuhirom-nur.url = "github:tokuhirom/nur-packages";
  };

  outputs = { self, nixpkgs, tokuhirom-nur }:
    let
      system = "aarch64-darwin";  # or your system
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells.default = pkgs.mkShell {
        buildInputs = [
          tokuhirom-nur.packages.${system}.apprun-dedicated-provisioner
        ];
      };
    };
}
```

## Adding a new package

1. Create a package definition at `pkgs/<package-name>/default.nix`
2. Add `<package-name> = pkgs.callPackage ./pkgs/<package-name> { };` to `default.nix` (without this, the package won't be included in the flake's `packages` output and won't be accessible from devbox, etc.)
3. Update the Packages table in this README

For Go projects, you can use GoReleaser to generate the nix package definition automatically. See [dashyard's .goreleaser.yaml](https://github.com/tokuhirom/dashyard/blob/main/.goreleaser.yaml) for a reference configuration.

## Development

```bash
# Build a package
nix build .#apprun-dedicated-provisioner

# Check all packages
nix flake check
```
