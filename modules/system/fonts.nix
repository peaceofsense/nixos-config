{ pkgs, ... }: {
  

  fonts = {
    packages = with pkgs; [
      # Fonts
      nerd-fonts.fira-code
      font-awesome
      material-icons
      material-design-icons
      emacs-all-the-icons-fonts
      roboto
      corefonts
      vista-fonts
      source-sans
      twemoji-color-font
      inter
      inter-nerdfont
      dejavu_fonts
      nerd-fonts.jetbrains-mono
      nerd-fonts.symbols-only
      nerd-fonts.ubuntu-sans
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
    #  (nerdfonts.override {fonts = ["JetBrainsMono"];})
    ];

    enableDefaultPackages = false;

    # This fixes emoji stuff
    fontconfig = {
      defaultFonts = {
        monospace = [
          "JetBrainsMono Nerd Font"
          "JetBrainsMono"
          "Noto Color Emoji"
        ];
        sansSerif = ["Inter" "Noto Sans"];
        serif = [ "DejaVu Serif" "Noto Serif" "Noto Color Emoji"];
        emoji = ["Noto Color Emoji"];
      };
      # Fixes pixelation
      antialias = true;

      # Fixes antialiasing blur
      hinting = {
        enable = true;
        style = "full"; # no difference
        autohint = true; # no difference
      };

      subpixel = {
        # Makes it bolder
        rgba = "rgb";
        lcdfilter = "default"; # no difference
      };
    };
  };

  # Install GTK/Qt Themes and Icon Themes
  environment.systemPackages = with pkgs; [
    # GTK Themes
    arc-theme
    adw-gtk3
    adwaita-qt
    graphite-gtk-theme
    matcha-gtk-theme
    pop-gtk-theme

    # Icon Themes
    papirus-icon-theme
  ];

}
