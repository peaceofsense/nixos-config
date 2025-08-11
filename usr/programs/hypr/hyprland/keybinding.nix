{ config, pkgs, ... }:

{
  # Enable Hyprland for your user
  wayland.windowManager.hyprland = {
    # Declarative Hyprland config as Nix attributes:
    settings = {
      # Keybindings
      bind = [
        "$mainMod, RETURN, exec, $terminal"
        "$mainMod+SHIFT, Q, killactive,"
        "$mainMod, X, exec, $powermenu"
        "$mainMod, N, exit"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, V, togglefloating,"
        "$mainMod, F, fullscreen, 0"
        "$mainMod, D, exec, $menu"
        "$mainMod, C, exec, rofi -show calc"
        "$mainMod, period, exec, rofimoji --action copy"
        # "$mainMod, TAB, exec, $windowMenu"
        "$mainMod, M, fullscreen, 1"
        "$mainMod, P, pseudo,"
        "$mainMod, T, togglesplit,"
        # "$mainMod CTRL SHIFT, S, exec, mkdir -p ~/Pictures/Screenshots && grim -g \"$(slurp)\" ~/Pictures/Screenshots/$(date +'%s_grim.png')"
        "$mainMod, INSERT, exec, hyprshot -m window -o ~/Pictures/Screenshots/"
        ", INSERT, exec, hyprshot -m output -o ~/Pictures/Screenshots/"
        "$mainMod CTRL SHIFT, INSERT, exec, hyprshot -m region -o ~/Pictures/Screenshots/"
        "$mainMod+Shift, U, exec, setxkbmap -layout us"
        "$mainMod+Shift, L, exec, hyprlock"
        # Audio and media
        # ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-"
        # ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        # ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioRaiseVolume, exec, pamixer -i 1"
        ", XF86AudioLowerVolume, exec, pamixer -d 1"
        ", XF86AudioMicMute, exec, pamixer --default-source -t"
        ", XF86AudioMute, exec, pamixer -t"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
        ",XF86MonBrightnessUp, exec, brightnessctl set +10%"
        ",XF86MonBrightnessDown, exec, brightnessctl set 10%-"
        # Focus movement
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"
        # Swap windows
        "$mainMod SHIFT, left, swapwindow, l"
        "$mainMod SHIFT, right, swapwindow, r"
        "$mainMod SHIFT, up, swapwindow, u"
        "$mainMod SHIFT, down, swapwindow, d"
        # Resize
        "$mainMod CTRL, left, resizeactive, -60 0"
        "$mainMod CTRL, right, resizeactive, 60 0"
        "$mainMod CTRL, up, resizeactive, 0 -60"
        "$mainMod CTRL, down, resizeactive, 0 60"
        # Workspaces
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, w, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, a, workspace, 10"
        "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
        "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
        "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
        "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
        "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
        "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
        "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
        "$mainMod SHIFT, w, movetoworkspacesilent, 8"
        "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
        "$mainMod SHIFT, a, movetoworkspacesilent, 10"
        # Special workspace
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"
        # Scroll workspaces
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
      ];

      # Mouse bindings
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };

}
