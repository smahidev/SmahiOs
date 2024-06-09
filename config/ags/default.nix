{ config, pkgs, ...}:
{
   home.file."${config.home.homeDirectory}/.config/ags" = { 
    source = ../ags; 
    recursive = true;
  };
}