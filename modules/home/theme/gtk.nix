{ config, pkgs, ... }:
{
  # Global cursor (sets XCURSOR_THEME, XCURSOR_SIZE, works for GTK + Qt + Wayland)
  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
    gtk.enable = true;
    x11.enable = true;   # for any XWayland apps
  };

  gtk = {
    enable = true;

    theme = {
      package = pkgs.adw-gtk3;
      name = "adw-gtk3-dark";   # use the dark variant directly, not extraConfig
    };

    iconTheme = {
      package = pkgs.tela-circle-icon-theme;
      name = "Papirus-Dark";  # dark variant if available
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;  # int, not string
    };
    gtk4.theme = null;

    # gtk4.extraConfig has limited effect; libadwaita reads dconf instead
  };

  # Required for GTK4/libadwaita dark mode
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      cursor-theme = "Bibata-Modern-Classic";
      cursor-size = 24;
      icon-theme = "Papirus-Dark";
      gtk-theme = "adw-gtk3-dark";
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "adwaita";   # makes Qt apps follow GTK/Adwaita style
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
      setSessionVariables = false;
    };
  };
}
