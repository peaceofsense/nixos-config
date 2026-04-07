{ config, pkgs, ... }:

{
    qt = {
        enable = true;
    #  platformTheme.name = "kvantum";
    #  style.package = pkgs.adwaita-qt;
    #  style.name = "kvantum";

    };
    /*
    home.pointerCursor = {
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Ice";
        size = 24;
        gtk.enable = true;
    };
    */
    gtk = {
        enable = true;


        #font = {
        #  name = "Inter";
        #  package = pkgs.google-fonts.override {fonts = ["Inter"];};
        #  size = 10;
        #};

        theme.package = pkgs.lib.mkForce pkgs.adw-gtk3;
        theme.name = pkgs.lib.mkForce "adw-gtk3";
      #  iconTheme.package = pkgs.papirus-icon-theme;
        iconTheme.package = pkgs.tela-circle-icon-theme;
        iconTheme.name = "Tela-circle";

        cursorTheme = {
              name = "Bibata-Modern-Classic";
              package = pkgs.bibata-cursors;
              size = 24;
            };

        gtk3.extraConfig = {
            gtk-application-prefer-dark-theme = ''
                1
                '';
        };
        gtk4.extraConfig = {
            gtk-application-prefer-dark-theme = ''
                1
                '';
        };
    };

    xdg.enable = true;
    xdg.userDirs = {
        enable = true;
        createDirectories = true;
    };
}
