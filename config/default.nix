{ config, pkgs, nix-colors, ags, androidSdk, ... }:

{
  home.username = "sn";
  home.homeDirectory = "/home/sn";
  
  imports = [
    nix-colors.homeManagerModules.default
    ags.homeManagerModules.default
    ./ags
    ./browsers
    ./dunst
    ./fish
    ./git
    ./hyprland
    ./kitty
    ./micro
    ./phpstorm
    ./vscode
    ./waybar
    ./wlogout
    ./wofi
  ];
  
  home.packages = with pkgs; [
    anydesk
    androidSdk
    curl
    firebase-tools
    flutter
    font-awesome 
    neofetch 
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ranger 
    unzip  
  ];
  programs.btop.enable = true;  
  programs.ags = {
    enable = true;
  };
  
  gtk.enable = true;
  gtk.theme.package = pkgs.adw-gtk3;
  gtk.theme.name = "adw-gtk3";
  gtk.cursorTheme.package = pkgs.bibata-cursors;
  gtk.cursorTheme.name = "Bibata-Modern-Ice";
  gtk.cursorTheme.size = 12;

  colorScheme = nix-colors.colorSchemes.tokyo-night-dark;

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
