{ config, pkgs, ... }:
let
  palette = config.colorScheme.palette;
in
{
  programs.wlogout.style = ''

      * {
        font-family: "JetBrainsMono Nerd Font Propo";
        background-image: none;
        transition: 20ms;
        box-shadow: none;
      }

      window {
        background: #${palette.base00};
        background-size: cover;
      }

      button {
        color: #FFFFFF;
        font-size:16px;
        background-repeat: no-repeat;
        background-position: center;
        background-size: 16%;
        border-style: solid;
        background-color: rgba(12, 12, 12, 0.3);
        border: 3px solid #FFFFFF;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
      }

      button:focus,
      button:active,
      button:hover {
        color: #${palette.base08};
        background-color: rgba(12, 12, 12, 0.5);
        border: 3px solid #${palette.base04};
      }

      /* 
      ----------------------------------------------------- 
      Buttons
      ----------------------------------------------------- 
      */

      #lock {
        margin: 10px;
        border-radius: 20px;
        background-image: image(url("icons/lock.png"));
      }

      #logout {
        margin: 10px;
        border-radius: 20px;
        background-image: image(url("icons/logout.png"));
      }

      #suspend {
        margin: 10px;
        border-radius: 20px;
        background-image: image(url("icons/suspend.png"));
      }

      #hibernate {
        margin: 10px;
        border-radius: 20px;
        background-image: image(url("icons/hibernate.png"));
      }

      #shutdown {
        margin: 10px;
        border-radius: 20px;
        background-image: image(url("icons/shutdown.png"));
      }

      #reboot {
        margin: 10px;
        border-radius: 20px;
        background-image: image(url("icons/reboot.png"));
      }


  '';
}