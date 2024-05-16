{ config, pkgs, ... }:
{
  #programs.adb.enable = true;
  users.users.sn = {
    isNormalUser = true;
    description = "sn";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [];
  };
 
}
