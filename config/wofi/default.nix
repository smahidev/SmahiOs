{ pkgs, config, ... }:


{
  programs.wofi.enable = true;
  import = [
    ./configuration.nix
    ./style.nix
  ];
}