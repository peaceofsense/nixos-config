{ pkgs, pkgsUnstable, inputs, ... }: {

  # List packages installed in system profile.

  environment.systemPackages =
    (with pkgsUnstable; [
      # Unstable here
      yazi
      noctalia-shell
      zed-editor
      antigravity


    ])

    ++

    (with pkgs; [
      niri
      xwayland-satellite
      claude-code
      claude-monitor

      # Dictionary
      hunspellDicts.en_GB-ise
      hunspellDicts.en_GB-ize
      hunspellDicts.de_DE

      # Office and Productivity
      blanket
      #fiji
      gnome-clocks
      libreoffice-fresh
      localsend
      obsidian
      opentabletdriver
      pandoc
      pdfarranger
      #protonmail-desktop
      #rclone
      #rclone-ui
      #rnote libinput
      #slack
      syncthing
      texliveFull
      thunderbird
      #xournalpp
      zathura
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
      libmtp
      mtpfs
      gnome.gvfs
      htop
      hypridle
      hyprland
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
      (pkgs.writeShellScriptBin "nemo-float" ''
        exec ${pkgs.nemo}/bin/nemo --app-id "nemo-float" "$@"
      '')
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
      samba
      sl
      slurp
      smartmontools
      sticky
      stow
      swappy
      #swaynotificationcenter
      tealdeer
      xfce.thunar
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
      #tailscale
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
      wlogout

      # Web Browsing
      brave
      mullvad-browser

      # Development Tools
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
      #discord
      #ferdium
      #fractal
      freerdp
      #github-desktop
      kdePackages.kdeconnect-kde
      openconnect
      rdesktop
      remmina
      wsdd
      #kdePackages.xwaylandvideobridge #x11 to wayland screensharing
      #zoom-us

      # Multimedia
      ffmpeg-full
      ffmpeg-headless
      ffmpegthumbnailer
      fswebcam
      kooha
      libheif
      libraw
      nufraw
      obs-studio
      playerctl
      pavucontrol
      scrcpy
      spotify-player
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
      solaar
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
