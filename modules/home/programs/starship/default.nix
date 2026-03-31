{ config, lib, ... }:
{
  options.starship.enable = lib.mkEnableOption "enable starship";

  config = lib.mkIf config.starship.enable { # ONLY enable the shell integration.
    programs.starship.enable = true;
  };
}
