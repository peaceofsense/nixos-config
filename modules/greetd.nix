{ config, pkgs, ... }:
{
# Auto login
  services = {
    greetd = {
      enable = true;
      settings = {
        initial_session = {
          # Change "Hyprland" to the command to run your window manager.
          command = "niri";
          user = "peaceofsense";
        };

        default_session = {
          # Again here just change "-cmd Hyprland" to "-cmd your-start-command".
          command = "${pkgs.tuigreet}/bin/tuigreet --asterisks --remember --remember-user-session --time --cmd niri";
          # DO NOT CHANGE THIS USER
          user = "greeter";
        };
      };
    };
  };


  # TUI login BACKUP
#  services.greetd = {
#   enable = false;
#    settings = {
#      default_session = {
#        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd ${pkgs.hyprland}/bin/Hyprland";
#        user = "peaceofsense";
#        };
#      };
#  };
}
