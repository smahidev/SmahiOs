{ config, pkgs, androidSdk, ... }:

{

  import = [
    ./hardware.nix
    ./laravel
  ];

  # Bootloader.
  boot.tmp.cleanOnBoot = true;
  boot.loader.grub = {
    enable = true;
    efiInstallAsRemovable = true;
    devices = ["nodev"];
    efiSupport = true;
    useOSProber = true;
    darkmatter-theme = {
      enable = true;
      style = "nixos";
      icon = "color";
      resolution = "1080p";
    };
  };

  networking = {
    hostName = "smahios"; # Define your hostname.
    networkmanager.enable = true;
    extraHosts = "127.0.0.1 *.test";
    firewall.allowedTCPPorts = [ 80 443 ];
  };

   # Set your time zone.
  time.timeZone = "Africa/Casablanca";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ar_MA.UTF-8";
    LC_IDENTIFICATION = "ar_MA.UTF-8";
    LC_MEASUREMENT = "ar_MA.UTF-8";
    LC_MONETARY = "ar_MA.UTF-8";
    LC_NAME = "ar_MA.UTF-8";
    LC_NUMERIC = "ar_MA.UTF-8";
    LC_PAPER = "ar_MA.UTF-8";
    LC_TELEPHONE = "ar_MA.UTF-8";
    LC_TIME = "ar_MA.UTF-8";
  };

  console.keyMap = "fr";

  users.users.sn = {
    isNormalUser = true;
    description = "sn";
    extraGroups = [ "networkmanager" "wheel" "caddy" "video"];
    shell = pkgs.fish;
    packages = with pkgs; [];
  };

   # Audio 
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };

  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "${pkgs.hyprland}/bin/Hyprland";
        user = "sn";
      };
      default_session = initial_session;
    };
  };

  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [ "nix-command" "flakes" ];
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    brightnessctl
  ];

  programs.hyprland.enable = true;
  programs.java.enable = true;

  environment.sessionVariables = rec {
    ANDROID_HOME = "${androidSdk}/libexec/android-sdk";
    ANDROID_SDK_ROOT = "${androidSdk}/libexec/android-sdk";
    GRADLE_OPTS = "-Dorg.gradle.project.android.aapt2FromMavenOverride=${androidSdk}/libexec/android-sdk/build-tools/34.0.0/aapt2";
  };
 
  system.stateVersion = "23.11"; # Did you read the comment?
}