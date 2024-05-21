{...}:
{
  programs.fish = { 
    enable = true;
    shellInit = "
      neofetch --ascii ~/.config/fish/neofetch/ascii-neofetch
    ";
  };
}