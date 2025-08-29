# modules/users.nix
{ config, pkgs, ... }:

{
  users.users.peaceofsense = {
    isNormalUser = true;
    description = "peaceofsense";
    extraGroups = [ "adbsuers" "docker" "sambashare" "networkmanager" "i2c" "plugdev" "wheel" "input" "libvirtd" "vboxusers" "qemu-libvirtd" "video" "audio" "disk" ];
    packages = with pkgs; [

    ];
    shell = pkgs.fish;
  };
}
