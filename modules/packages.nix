{ pkgs, pkgsUnstable, inputs, ... }: {

  # List packages installed in system profile.

  environment.systemPackages = 
    (with pkgsUnstable; [
      # Unstable here
      yazi
      zed-editor
      inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default

    ])

    ++

    (with pkgs; [

    # Dictionary
    hunspellDicts.en_GB-ise
    hunspellDicts.en_GB-ize
    hunspellDicts.de_DE

    # Office and Productivity
    blanket
    fiji
    gnome-clocks
    libreoffice-fresh
    localsend
    obsidian
    opentabletdriver
    pandoc
    pdfarranger
    protonmail-desktop
    rclone
    rclone-ui
    rnote libinput
    slack
    syncthing
    texliveFull
    thunderbird
    #xournalpp
    zotero

    # Disk and Filesystem Utilities
    # ags
    cifs-utils
    exfatprogs
    gparted
    hfsprogs
    ntfs3g
    testdisk-qt


    # System Utilities
    appimage-run
    blueman    
    brightnessctl
    btop
    cava
    dconf
    ddcutil
    ddcui
    fastfetch
    feh
    fish
    font-manager
    fzf
    fprintd
    nautilus
    geoclue2
    glib
    gnome-calculator
    gnome-firmware
    gnugrep
    gsettings-desktop-schemas
    grim
    gvfs
    gnome.gvfs
    htop
    hypridle
    hyprland
    hyprlock
    hyprpaper
    hyprpicker
    hyprshot
    kitty
    kittysay
    libqalculate
    libnotify
    #libstdcxx5
    libtiff
    lm_sensors
    loupe
    nemo
    neovim
    networkmanager
    nix-search-tv
    ocrmypdf
    overskride
    pamixer
    parted
    polkit_gnome
    pv
    rar
    ripgrep
    ripgrep-all
    rofimoji
    rofi
    samba
    sl
    slurp
    smartmontools
    sticky
    stow
    swappy
    swaynotificationcenter
    tealdeer
    trash-cli
    tree
    unrar
    unzip
    usbutils
    wget
    wl-clipboard
    wlsunset
    cliphist
    xclip
    xdg-utils
    zip
    zoxide

    # System Customization
    aubio
    banana-cursor
    bibata-cursors
    eyedropper
    pipewire
    neofetch
    nwg-look
    pywal
    starship
    waybar
    wlogout

    # Web Browsing
    brave
    mullvad-browser

    # Development Tools
    vscode
    conda
    gcc
    geany
    git
    lua
    luajitPackages.luarocks
    vscodium-fhs
    wtype
    tmux

    # Networking and Communication
    discord
    #ferdium
    #fractal
    freerdp
    github-desktop
    kdePackages.kdeconnect-kde
    openconnect
    rdesktop
    remmina
    wsdd
    #kdePackages.xwaylandvideobridge #x11 to wayland screensharing
    zoom-us

    # Multimedia
    ffmpeg-full
    ffmpeg-headless
    ffmpegthumbnailer
    fswebcam
    kooha
    libheif
    libraw
    ncspot
    nufraw
    obs-studio
    playerctl
    pavucontrol 
    scrcpy
    spotify
    vlc

    # Virtualisation
    gnome-boxes

    # Security & Privacy
    bleachbit
    eduvpn-client
    gnome-obfuscate
    nftables
    proton-pass
    protonvpn-gui
    ente-cli
    ente-auth
    gnupg # Signature and encryption lib
    pinentry-curses
    xmrig

    # Miscellaneous
    android-tools
    cmatrix
    cowsay
    #mangohud
    wttrbar
    dotnet-runtime
    #lutris
    #(lutris.override {
    #   extraPkgs = pkgs: [
         # List package dependencies here
    #   ];
    #})
    wineWowPackages.stable
    winetricks
  ]);

}
