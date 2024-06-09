{ pkgs, config, ... }:
{
  # Configure Kitty
  programs.kitty.enable = true;       
   imports = [
    ./configuration.nix
    ./style.nix
   ];
}