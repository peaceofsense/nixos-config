{ config, pkgs, ... }:

{
  # ... other configurations ...

  # Ensure hyprlock is enabled and configured via Home Manager
  # programs.hyprlock = {
  #   enable = true;
  #   # ... your hyprlock specific settings
  # };

  services.hypridle = {
    enable = true;
    package = pkgs.hypridle; # Or your preferred hypridle package
    settings = {
      general = {
        lock_cmd = "${pkgs.hyprlock}/bin/hyprlock";           # Correct
        unlock_cmd = "notify-send 'Screen Unlocked'";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "notify-send 'Woke up!'";
        ignore_dbus_inhibit = false; #should obey inhibit calls from dbus
        ignore_logind_inhibit = false;
      };

      listener = [
        {
          timeout = 300;
          on-timeout = "${pkgs.brightnessctl}/bin/brightnessctl set 10%";
          on-resume = "${pkgs.brightnessctl}/bin/brightnessctl set 100%";
        }
        {
          timeout = 600;
          on-timeout = "${pkgs.hyprlock}/bin/hyprlock";
        }
        {
          timeout = 900;
          on-timeout = "systemctl suspend";
        }
        {
          timeout = 900;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };

  # ... other configurations ...
}
