{ config, pkgs, ...}:

{
  home.packages = with pkgs; [
    (import ./exit.nix { inherit pkgs; })
    (import ./hibernate.nix { inherit pkgs; })
    (import ./lock.nix { inherit pkgs; })
    (import ./reboot.nix { inherit pkgs; })
    (import ./suspend.nix { inherit pkgs; })
    (import ./shutdown.nix { inherit pkgs; })
  ];

  
}
