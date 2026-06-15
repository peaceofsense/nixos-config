{ pkgs, pkgsUnstable, inputs, ... }: {

  # List packages installed in system profile.

  environment.systemPackages =
    (with pkgsUnstable; [
      # Unstable here
      yazi
      zed-editor
      hyprland

    ])

    ++

    (with pkgs; [
      dgop
      dms-shell
      quickshell
      niri
      matugen
      xwayland-satellite

      # Games
      pysolfc
      gnome-sudoku
      gnome-mahjongg
      gnome-mines

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
      onlyoffice-desktopeditors
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
      android-tools
      blueman
      brightnessctl
      btop
      cava
      dconf
      ddcutil
      ddcui
      fastfetch
      feh
      file-roller
      fish
      foliate
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
      ollama
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
      thunar
      trash-cli
      tree
      unrar
      unzip
      usbutils
      wget
      wl-clipboard
      wlsunset
      cliphist
      xarchiver
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
      hyfetch
      pipewire
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
      git
      kdePackages.kate
      lua
      luajitPackages.luarocks
      vscodium-fhs
      wtype
      tmux
      gurobi

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
      ncspot
      nufraw
      obs-studio
      playerctl
      pavucontrol
      scrcpy
      vlc

      # Virtualisation
      gnome-boxes

      # Security & Privacy
      bleachbit
      eduvpn-client
      gnome-obfuscate
      nftables
      proton-pass
      proton-vpn
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
      wineWow64Packages.stable
      winetricks
  ]);

}
