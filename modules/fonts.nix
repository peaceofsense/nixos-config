{pkgs, ...}: 

{
  fonts = {
    packages = with pkgs; [
      font-awesome
      material-icons
      material-design-icons
      emacs-all-the-icons-fonts
      roboto
      google-fonts
      work-sans
      corefonts
      vistafonts
      comic-neue
      source-sans
      twemoji-color-font
      comfortaa
      inter
      lato
      lexend
      jost
      dejavu_fonts
      nerdfonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
      jetbrains-mono
      font-awesome_5
      (nerdfonts.override {fonts = ["JetBrainsMono"];})
    ];

    enableDefaultPackages = false;

    # this fixes emoji stuff
    fontconfig = {
      defaultFonts = {
        monospace = [
          "JetBrainsMono Nerd Font"
          "JetBrainsMono"
          "Noto Color Emoji"
        ];
        sansSerif = ["Lexend" "Noto Color Emoji"];
        serif = ["Noto Serif" "Noto Color Emoji"];
        emoji = ["Noto Color Emoji"];
      };
    };
  };
}
