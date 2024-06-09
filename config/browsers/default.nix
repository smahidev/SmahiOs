{ config, pkgs, ...}:
{
  programs = {
    firefox = {
      enable = true;
      package = pkgs.floorp; 
    };
    chromium = {
      enable = true;
      package = pkgs.brave; 
    };
  };
}