{
  imports = [
    ./hypr
    ./kitty.nix
    ./obsidian.nix
    ./starship
    ./vscode
    ./yazi.nix
  ];

  programs.btop = {
    enable = true;
  };

}