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
    # Note: GNU Stow is used for most dotfiles.
    home.file = {

    };

    home.sessionVariables = {
        # EDITOR = "emacs";
    };

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

    imports = [
        ../../modules/home/programs
        ../../modules/home/shell/fish.nix
        ../../modules/home/theme/gtk.nix
        ../../modules/home/git.nix
    ];
}
