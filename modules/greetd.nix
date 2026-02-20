  # TUI login BACKUP
  services.greetd = {
    enable = false;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd ${pkgs.hyprland}/bin/Hyprland";
        user = "peaceofsense";
        };
      };
  };