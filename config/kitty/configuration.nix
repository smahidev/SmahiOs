{ config, pkgs, ...}:
{
  programs.kitty.settings = {
      scrollback_lines = 2000;
      wheel_scroll_min_lines = 1;
      window_padding_width = 4;
      confirm_os_window_close = 0;
    };
}