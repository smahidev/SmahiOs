{ config, pkgs, ...}:
{
  home.packages = with pkgs; [
    hyprpaper
  ];
  home.file."${config.home.homeDirectory}/.config/wallpapers/Beach-Dark.png" = { 
    source = ./Beach-Dark.png; 
    recursive = true;
  };
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;
      preload = ["~/.config/wallpapers/Beach-Dark.png"];
      wallpaper = [",~/.config/wallpapers/Beach-Dark.png"];
    };
  };
}