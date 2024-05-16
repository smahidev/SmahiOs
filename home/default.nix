{ config, pkgs, inputs, androidSdk, ... }:

{
  # TODO please change the username & home directory to your own
  home.username = "sn";
  home.homeDirectory = "/home/sn";
  
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./hyprland
    ./waybar
    ./rofi.nix
    ./kitty.nix
    ./git.nix
    ./vscode.nix
    ./packages.nix 
    ./neofetch.nix
    ./micro.nix

  ];
  colorScheme = inputs.nix-colors.colorSchemes."dracula";
  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
