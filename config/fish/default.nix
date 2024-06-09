{pkgs, config, ...}:
{
  programs.fish = { 
    enable = true;
    interactiveShellInit = ''
      set -x PATH $HOME/.pub-cache/bin $PATH
    '';
    shellInit = "
      neofetch --ascii ~/.config/fish/neofetch/ascii-neofetch 
    ";
  };

  imports = [
    ./ascii-neofetch.nix
    ./neofetch-conf.nix

  ];

}
