{ config, pkgs, ...}:
{
  programs.wofi.settings = {
    allow_images = true;
    prompt = "Run Programs...";
    width = "35%";
    hide_scroll = true;
    term = "kitty";
    show = "drun";
  };
}