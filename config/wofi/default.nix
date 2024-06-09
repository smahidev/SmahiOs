{ pkgs, config, ... }:


{
  programs.wofi.enable = true;
  imports = [
    ./configuration.nix
    ./style.nix
  ];
}