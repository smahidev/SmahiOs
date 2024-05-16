{config, pkgs, ...}:
{
  programs.fish = { 
    enable = true;
    shellInit = "
      neofetch --ascii ~/.config/neofetch/ascii-neofetch
    ";
  };
}