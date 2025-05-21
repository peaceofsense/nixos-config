{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    # Window rules v2
    windowrulev2 = [
      "workspace 10, title:Spotify Premium"
      "workspace 1, class:(obsidian)"
      "workspace 2, class:(zen)"
      # "float,class:^(kitty)$,title:^(kitty)$"
      # "workspace 2 silent, initialClass:(firefox)"
      # "workspace 3 silent, class:(thunar)"
      # "workspace 9 silent, class:(Slack)"
      # "workspace 8 silent, class:(thunderbird)"
      "float, class:(qalculate-gtk)"
      "float, class:(org.gnome.Characters)"
      "float, class:(xdg-desktop-portal-gtk)"
      "float, class:(org.gnome.Calculator)"
      "float, initialTitle:(Calendar Reminders)"
      "float, title:^(Picture-in-Picture)$"
      "float, class:(org.kde.kdeconnect.app)"
      "pin, title:^(Picture-in-Picture)$"
      "move 69.5% 4%, title:^(Picture-in-Picture)$"
      "float, class:(steam)"
      "float, class:(soffice)"
      "float, initialTitle:(File Operation Progress)"
      "size 600 200, initialTitle:(File Operation Progress)"
      "suppressevent maximize, class:.*"
    ];
  };
}
