{ config, pkgs, nix-colors, androidSdk, ... }:

{
  home.username = "sn";
  home.homeDirectory = "/home/sn";
  
  imports = [
    nix-colors.homeManagerModules.default
    ./fish
    ./git
    ./hyprland
    ./kitty
    ./micro
    ./phpstorm
    ./scripts
    ./vscode
    ./waybar
    ./wofi
  ];

  home.packages = with pkgs; [
    anydesk
    androidSdk
    curl
    firebase-tools
    floorp 
    flutter319
    font-awesome 
    neofetch 
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ranger 
    unzip  
  ];
  
  
  colorScheme = nix-colors.colorSchemes.tokyo-night-dark;


  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
