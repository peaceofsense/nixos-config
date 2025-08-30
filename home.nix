{ config, pkgs, ... }:

{
  home.username = "peaceofsense";
  home.homeDirectory = "/home/peaceofsense";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.

  home.stateVersion = "25.05"; # Please read the comment before changing.

  home.packages = [

  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {

  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.fish = {
    enable = true;
    # Fish shell initialization
    shellInit = ''
      set -g fish_greeting ""
      starship init fish | source
      zoxide init fish | source

      function connect-fau
        sudo openconnect --authgroup=FAU-Fulltunnel vpn.fau.de
      end

      function git-push
          # Use current directory if no argument provided
          if test (count $argv) -eq 0
              set repo_dir (pwd)
          else
              set repo_dir (realpath $argv[1])
          end

          # Check if directory exists
          if not test -d $repo_dir
              echo "Error: Directory '$repo_dir' does not exist."
              return 1
          end

          # Check if it is a git repository
          if not test -d "$repo_dir/.git"
              echo "Error: '$repo_dir' is not a Git repository."
              return 1
          end

          # Get current branch (default to main)
          set branch (git -C $repo_dir symbolic-ref --short HEAD ^/dev/null)
          if test -z "$branch"
              set branch main
          end

          # Check for uncommitted changes
          if not git -C $repo_dir diff-index --quiet HEAD --
              echo "Changed files:"
              git -C $repo_dir diff --name-only HEAD

              # Prompt for commit message
              read -P "Enter commit message: " message
              if test -z "$message"
                  echo "Error: Commit message cannot be empty."
                  return 1
              end

              git -C $repo_dir add .
              git -C $repo_dir commit -m "$message"
          else
              echo "No changes to commit."
          end

          # Prompt for branch to push to
          read -P "Enter branch name to push to (default: $branch): " input_branch
          if test -z "$input_branch"
              set input_branch $branch
          end

          # Push
          git -C $repo_dir push origin $input_branch
      end

      # NixOS rebuild function
      function nixos_rebuild
          echo "Running nixos-rebuild switch..."
          sudo nixos-rebuild switch --flake ~/nixos-config/

          if test $status -eq 0
              echo "NixOS rebuilt successfully."
          else
              echo "NixOS rebuild failed."
          end
      end

      function xfreerdp-evt
          xfreerdp /v:10.188.251.74 /cert:ignore /u:ratheesan +clipboard /dynamic-resolution
      end

      function xfreerdp-crt
          xfreerdp /v:131.188.124.128:11005 /cert:ignore /u:jo43zezi +clipboard /dynamic-resolution
      end

      function ddcutil-bash
          sudo ddcutil --display 1 setvcp 10
      end

      function snek
          /home/peaceofsense/.conda/envs/snek/bin/python $argv
      end

      function y
          set tmp (mktemp -t "yazi-cwd.XXXXXX")
          yazi $argv --cwd-file="$tmp"

          if test -s "$tmp"
              set cwd (cat "$tmp")
              if test -n "$cwd" -a "$cwd" != "$PWD"
                  cd "$cwd"
              end
          end

          rm -f "$tmp"
      end

      function extract
          for archive in $argv
              if test -f "$archive"
                  switch $archive
                      case '*.tar.bz2'
                          tar xvjf "$archive"
                      case '*.tar.gz'
                          tar xvzf "$archive"
                      case '*.bz2'
                          bunzip2 "$archive"
                      case '*.rar'
                          rar x "$archive"
                      case '*.gz'
                          gunzip "$archive"
                      case '*.tar'
                          tar xvf "$archive"
                      case '*.tbz2'
                          tar xvjf "$archive"
                      case '*.tgz'
                          tar xvzf "$archive"
                      case '*.zip'
                          unzip "$archive"
                      case '*.Z'
                          uncompress "$archive"
                      case '*.7z'
                          7z x "$archive"
                      case '*'
                          echo "don't know how to extract '$archive'..."
                  end
              else
                  echo "'$archive' is not a valid file!"
              end
          end
      end

      function ftext
          if test (count $argv) -eq 0
              echo "Usage: ftext <search_term>"
              return 1
          end

          set search_term $argv[1]
          grep -iIHrn --color=always "$search_term" . | less -r
      end

      function mkdirg
          mkdir -p "$argv[1]"
          cd "$argv[1]"
      end

      function mvg
          if test -d "$argv[2]"
              mv "$argv[1]" "$argv[2]" && cd "$argv[2]"
          else
              mv "$argv[1]" "$argv[2]"
          end
      end

      function cpg
          if test -d "$argv[2]"
              cp "$argv[1]" "$argv[2]" && cd "$argv[2]"
          else
              cp "$argv[1]" "$argv[2]"
          end
      end

      function cpp
          pv "$argv[1]" > "$argv[2]"
      end


      # Aliases
      alias rebuild='nixos_rebuild'
      alias nixos-update='nix flake update --flake ~/nixos-config'
      alias pickfont='fc-list :family | cut -d: -f2 | sort | uniq | fzf'
      alias vi='nvim'
      alias rm='trash -v'


      alias la='ls -Alh'                # show hidden files
      alias ls='ls -aFh --color=always' # add colors and file type extensions
      alias lx='ls -lXBh'               # sort by extension
      alias lk='ls -lSrh'               # sort by size
      alias lc='ls -lcrh'               # sort by change time
      alias lu='ls -lurh'               # sort by access time
      alias lr='ls -lRh'                # recursive ls
      alias lt='ls -ltrh'               # sort by date
      alias lm='ls -alh |more'          # pipe through 'more'
      alias lw='ls -xAh'                # wide listing format
      alias ll='ls -Fls'                # long listing format
      alias labc='ls -lap'              #alphabetical sort
      alias lf="ls -l | egrep -v '^d'"  # files only
      alias ldir="ls -l | egrep '^d'"   # directories only

      alias f="find . | grep " # Check find text top
      alias tree='tree -CAhF --dirsfirst'
      alias treed='tree -CAFd'

      alias mktar='tar -cvf'
      alias mkbz2='tar -cvjf'
      alias mkgz='tar -cvzf'
      alias untar='tar -xvf'
      alias unbz2='tar -xvjf'
      alias ungz='tar -xvzf'






    '';



  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };


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

    #theme.package = pkgs.adw-gtk3;
    #theme.name = "adw-gtk3";
    iconTheme.package = pkgs.papirus-icon-theme;
    iconTheme.name = "Papirus-Dark";


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
    extraConfig = {
      XDG_GAME_DIR = "${config.home.homeDirectory}/Media/Games";
      XDG_GAME_SAVE_DIR = "${config.home.homeDirectory}/Media/Game Saves";
    };
  };

  imports = [
    ./usr/programs
    ./usr/core-system
  ];
  
}
