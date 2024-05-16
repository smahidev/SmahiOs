{ config, pkgs, androidSdk, ...}:

{
  home.packages = with pkgs; [
    anydesk
    androidSdk
    devbox
    firebase-tools
    floorp 
    flutter319
    font-awesome 
    neofetch 
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ranger 
    rofi-wayland  
    unzip  
  ];

  
}
