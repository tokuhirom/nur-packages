# nur-packages

**My personal [NUR](https://github.com/nix-community/NUR) repository**

![Build and populate cache](https://github.com/tokuhirom/nur-packages/workflows/Build%20and%20populate%20cache/badge.svg)

## Packages

| Package | Description |
|---------|-------------|
| `apprun-dedicated-application-provisioner` | SAKURA Cloud AppRun provisioner |
| `db-schema-sync` | Database schema synchronization tool |

## Usage

### With Flakes

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
          tokuhirom-nur.packages.${system}.db-schema-sync
          tokuhirom-nur.packages.${system}.apprun-dedicated-application-provisioner
        ];
      };
    };
}
```

### With NUR (after registration)

```nix
{ pkgs, nur, ... }:
{
  environment.systemPackages = [
    nur.repos.tokuhirom.db-schema-sync
  ];
}
```

## Development

```bash
# Build a package
nix build .#db-schema-sync

# Check all packages
nix flake check
```
