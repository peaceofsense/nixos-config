{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    settings = {
      # AUTOSTART
      exec-once = [
        "[workspace 5 silent] thunderbird"
        #"swaync" # notification
        #waybar
        # "hyprctl setcursor Bibata-Modern-Classic 24"
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "polkit-agent-helper-1"
        "systemctl start --user polkit-gnome-authentication-agent-1"
        "wl-paste --type text --watch cliphist store" # Stores only text data
        #"wl-paste --type image --watch cliphist store" # Stores only image data
        "noctalia-shell"
        "hyprctl setcursor Bibata-Modern-Ice 25"

      ];

      exec = [
        #"gammastep -l 52.52:13.41 -t 6500:3500 &" # berlin
      ];

      cursor = {
        no_hardware_cursors = false; # Set to true only if you have an Nvidia GPU and the cursor is invisible
      };

      env = [
        "XCURSOR_SIZE,25"
        "XCURSOR_THEME,Bibata-Modern-Ice"
      ];
    };
  };
}
