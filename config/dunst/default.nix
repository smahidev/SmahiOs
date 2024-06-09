{ config, pkgs, ... }:
let
  palette = config.colorScheme.palette;
in
{

  services.dunst = {
    enable = true;
    iconTheme = {
      name = "Adwaita-Dark";
      package = pkgs.gnome.adwaita-icon-theme;
    };
    settings = {
      global = {
        rounded = "yes";
        origin = "center";
        monitor = "0";
        alignment = "center";
        vertical_alignment = "center";
        width = "400";
        height = "400";
        scale = 0;
        gap_size = 0;
        progress_bar = true;
        text_icon_padding = 0;
        separator_color = "frame";
        sort = "yes";
        idle_threshold = 120;
        line_height = 0;
        markup = "full";
        show_age_threshold = 60;
        ellipsize = "middle";
        ignore_newline = "no";
        stack_duplicates = true;
        sticky_history = "yes";
        history_length = 20;
        always_run_script = true;
        transparency = 10;
        frame_color = "#${palette.base0C}";
        font = "Jetbrains Nerd Font";
        frame_width = 1;
        offset = "0x10";
        horizontal_padding = 10;
        icon_position = "left";
        indicate_hidden = "yes";
        min_icon_size = 0;
        max_icon_size = 64;
        mouse_left_click = "do_action, close_current";
        mouse_middle_click = "close_current";
        mouse_right_click = "close_all";
        padding = 10;
        plain_text = "no";
        separator_height = 2;
        show_indicators = "yes";
        shrink = "no";
        word_wrap = "yes";
        browser = "${pkgs.floorp}/bin/floorp";
      };

      fullscreen_delay_everything = { fullscreen = "delay"; };

      urgency_normal = {
        background = "#${palette.base00}";
        foreground = "#ffffff";
        timeout = 10;
      };
    };
  };
}