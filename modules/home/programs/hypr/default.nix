{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hypridle.nix
    ./hyprland/autostart.nix
    ./hyprland/appearance.nix
    ./hyprland/keybinding.nix
    ./hyprland/window.nix
  ];

  wayland.windowManager.hyprland = {
    enable = false;


    settings = {
      # Monitors
      monitor = [
        #"monitor = ,preferred,auto-up,1" # Uncomment for quick fix if needed

        # Monitor left
        "DP-1,1920x1080,0x0,1"
        #"HDMI-A-2,1920x1080@60,0x0,1"
        "eDP-1,1920x1080,1920x200,1.5"


        # MOnitor right
        #"eDP-1, 1920x1080, -1600x200, 1.2"
        #"HDMI-A-2, 1920x1080@60,0x0, 1"

        #"eDP-1, 1920x1080, -1920x200, 1"
        # "DP-1, 1920x1080,1920x100, 1"

        # Monitors top and bottom
        #"HDMI-A-2,2560x1440,0x0,1"
        #"eDP-1,1920x1080,320x1440,1"
      ];

      # Plugin
      plugin = {

        hyprscrolling = {
          focus_fit_method = 1;
          follow_focus = false;
          fullscreen_on_one_column = true;
          column_default_width = "onehalf";
          column_widths = "0.5 1";
       };
      };

      # Triple monitor
      #monitor=DP-6,1920x1080@60,0x0,1
      #monitor=DP-7,1920x1080@60,1920x0,1
      #monitor=eDP-1,1920x1080@60,3840x0,1

      # Program variables
      "$mainMod" = "SUPER";
      "$terminal" = "kitty";
      #"$fileManager" = "nautilus --new-window";
      "$fileManager" = "nemo";
      "$powermenu" = "rofi -show power-menu -modi power-menu:~/nixos-config/usr/programs/rofi/power-menu";
      "$menu" = "rofi -show drun";

      # Input configuration
      input = {
        kb_layout = "de";
        kb_variant = "";
        kb_model = "";
        kb_options = "grp:alt_shift_toggle";
        kb_rules = "";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = true;
        };
      };

      # Gestures configuration
      "gesture" = "3, horizontal, workspace";
      #"gesture" = "3, down, mod: ALT, close";
      #gesture = 3, up, mod: SUPER, scale: 1.5, fullscreen
      #gesture = 3, left, scale: 1.5, float

      # Per-device input configs (as a list of attribute sets)
      device = [
        {
          name = "epic-mouse-v1";
          sensitivity = -0.5;
        }
        {
          name = "tpps/2-ibm-trackpoint";
          sensitivity = 0.5;
        }
      ];
    };
  };
}
