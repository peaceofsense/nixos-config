{ pkgs, ... }: {

  # List packages installed in system profile.

  environment.systemPackages = with pkgs; [
    # Office and Productivity
    anki
    jabref
    libreoffice-still
    localsend
    obsidian
    ollama
    kdePackages.okular    
    # opentabletdriver
    megasync
    pandoc
    pdfarranger
    texliveFull
    texstudio
    thunderbird
    xournalpp
    zathura
    zotero

    # Disk and Filesystem Utilities
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
    dconf
    ddcutil
    ddcui
    feh
    fzf
    nautilus
    gnome-firmware
    gnugrep
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
    libnotify
    libstdcxx5
    neovim
    pamixer
    parted
    qalculate-gtk
    ripgrep
    ripgrep-all
    rofi-wayland
    samba
    sl
    slurp
    smartmontools
    sticky
    stow
    swaynotificationcenter
    swayidle
    swaylock-effects
    tealdeer
    trash-cli
    tree
    unzip
    wget
    wl-clipboard
    xclip
    xdg-utils
    zip
    zoxide

    # System Customization
    bibata-cursors
    eyedropper
    fastfetch
    gnome-control-center
    gnomeExtensions.gsconnect
    nwg-look
    papirus-icon-theme
    phinger-cursors
    pywal
    starship
    waybar
    wl-color-picker
    wlogout

    # Web Browsing
    brave
    mullvad-browser
    vivaldi
    vivaldi-ffmpeg-codecs

    # Development Tools
    conda
    gcc
    geany
    git
    lua
    luajitPackages.luarocks
    vscodium-fhs
    wtype

    # Networking and Communication
    discord
    ferdium
    fractal
    freerdp3
    github-desktop
    kdePackages.kdeconnect-kde
    openconnect
    rdesktop
    remmina
    wsdd
    kdePackages.xwaylandvideobridge #x11 to wayland screensharing
    zoom-us

    # Multimedia
    ffmpeg-full
    fswebcam
    libheif
    libraw
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
    proton-pass
    ente-cli
    ente-auth
    gnupg # Signature and encryption lib
    pinentry-curses
    xmrig

    # Miscellaneous
    android-udev-rules
    android-tools
    cmatrix
    cowsay
    wttrbar
    yazi
    dotnet-runtime
  ];

}
