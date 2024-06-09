{ config, pkgs, ... }:
{
  programs.wlogout.enable = true;

  imports = [
   ./scripts
   ./layout.nix
   ./style.nix
  ];

  home.file."${config.home.homeDirectory}/.config/wlogout/icons" = { source = ./icons; recursive = true;};

}