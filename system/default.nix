{ config, pkgs, androidSdk, ... }:

{
  imports =
    [ 
      ./hardware.nix
      ./grub.nix
      ./network.nix
      ./audio.nix
      ./tz-lang.nix
      ./users.nix
      ./fish.nix
      ./java.nix
      ./hyprland.nix
    ];
 
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
  };
  nixpkgs.config.allowUnfree = true;


   environment.sessionVariables = rec {
    ANDROID_HOME = "${androidSdk}/libexec/android-sdk";
    ANDROID_SDK_ROOT = "${androidSdk}/libexec/android-sdk";
    GRADLE_OPTS = "-Dorg.gradle.project.android.aapt2FromMavenOverride=${androidSdk}/libexec/android-sdk/build-tools/34.0.0/aapt2";
  };
 
  system.stateVersion = "23.11"; # Did you read the comment?

}
