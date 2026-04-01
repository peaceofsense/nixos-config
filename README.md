# NixOS Configuration

Personal NixOS configuration using Nix Flakes and Home Manager.

## Overview

- **Host**: `monolith` (T480)
- **Window Manager**: Niri / Hyprland
- **Shell**: Fish with custom functions

## Directory Structure

```
.
├── flake.nix                 # Flake entry point (inputs & outputs)
├── hosts/
│   └── monolith/
│       ├── configuration.nix # System configuration
│       ├── hardware-configuration.nix
│       └── home.nix          # Home Manager entry
├── modules/
│   ├── system/               # NixOS system modules
│   │   ├── fonts.nix
│   │   ├── greetd.nix        # Login manager
│   │   ├── packages.nix      # System packages
│   │   ├── pipewire.nix      # Audio
│   │   ├── programs.nix
│   │   ├── services.nix
│   │   ├── stylix.nix        # Theming (disabled)
│   │   ├── users.nix
│   │   └── wallpapers/
│   └── home/                 # Home Manager modules
│       ├── git.nix
│       ├── programs/
│       │   ├── default.nix
│       │   ├── hypr/         # Hyprland config
│       │   ├── obsidian.nix
│       │   └── starship/
│       ├── shell/
│       │   └── fish.nix      # Fish shell & aliases
│       └── theme/
│           └── gtk.nix
└── dotfiles/                 # GNU Stow managed configs
    ├── hypr/
    ├── kitty/
    ├── niri/
    ├── noctalia/
    └── starship/
```

## Usage

### Rebuild System

```bash
sudo nixos-rebuild switch --flake .#monolith
```

Or use the fish function:

```bash
rebuild-monolith
```

### Update Flake Inputs

```bash
nix flake update
```

## Key Modules

| Module | Location | Description |
|--------|----------|-------------|
| Packages | `modules/system/packages.nix` | All system packages |
| Services | `modules/system/services.nix` | System services (desktop, network, power) |
| Fish Shell | `modules/home/shell/fish.nix` | Shell config, functions, aliases |
| GTK Theme | `modules/home/theme/gtk.nix` | GTK/Qt theming |


## Adding a New Host

1. Create `hosts/<hostname>/` with:
   - `configuration.nix`
   - `hardware-configuration.nix`
   - `home.nix`
2. Add the configuration in `flake.nix`:
   ```nix
   nixosConfigurations.<hostname> = lib.nixosSystem { ... };
   ```
3. Rebuild: `sudo nixos-rebuild switch --flake .#<hostname>`
