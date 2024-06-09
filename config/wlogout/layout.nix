{ config, pkgs, ...}:
{
  programs.wlogout.layout = [
    {
        label = "lock";
        action = "hypr-lock";
        text = "Lock";
        keybind = "l";
    }
    {
        label = "hibernate";
        action = "hypr-hibernate";
        text = "Hibernate";
        keybind = "h";
    }
    {
        label = "logout";
        action = "hypr-logout";
        text = "Exit";
        keybind = "e";
    }
    {
        label = "shutdown";
        action = "hypr-shutdown";
        text = "Shutdown";
        keybind = "s";
    }
    {
        label = "suspend";
        action = "hypr-suspend";
        text = "Suspend";
        keybind = "u";
    }
    {
        label = "reboot";
        action = "hypr-reboot";
        text = "Reboot";
        keybind = "r";
    }

  ];
}