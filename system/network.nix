{ config, pkgs, ... }:

{
  networking = {
    hostName = "smahios"; # Define your hostname.
    networkmanager.enable = true;
    firewall.allowedTCPPorts = [ 80 443 ];
  };
}
