{ pkgs, config, ... }:
{
  # Configure Kitty
  programs.kitty.enable = true;       
   import = [
    ./configuration.nix
    ./style.nix
   ];
}