{ config, pkgs, ...}:
{
   programs.waybar.enable = true;
   imports = [
    ./configuration.nix
    ./style.nix
   ];
}