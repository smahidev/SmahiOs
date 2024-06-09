{ config, pkgs, ...}:
{

  programs.hyprlock = {
    enable = true;
    settings = {
      background = [
        {
          monitor = "";
          path = "~/.config/wallpapers/Beach-Dark.png";
          color = "rgba(25, 20, 20, 1.0)";
          blur_passes = 3;
          blur_size = 4;
          noise = 0.0117;
          contrast = 1.3000;
          brightness = 0.8000;
          vibrancy = 0.2100;
          vibrancy_darkness = 0.0;
        }
      ];

      input-field = [
        {
          monitor = "";
          dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
          dots_spacing = 0.64; # Scale of dots' absolute size, 0.0 - 1.0
          hide_input = false;
          halign = "center";
          valign = "bottom";
          size = "200, 50";
          position = "0, 80";
          dots_center = true;
          fade_on_empty = false;
          font_color = "rgb(202, 211, 245)";
          inner_color = "rgb(91, 96, 120)";
          outer_color = "rgb(24, 25, 38)";
          outline_thickness = 3;
          placeholder_text = "<i>Password...</i>";
          shadow_passes = 2;
        }
      ];
    };
  };
}