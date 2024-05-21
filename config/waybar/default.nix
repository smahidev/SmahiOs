{ config, pkgs, ...}:
{
   programs.waybar.enable = true;
   import = [
    ./configuration.nix
    ./style.nix
   ];
}