{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    grub-theme = {
      url = gitlab:VandalByte/darkmatter-grub-theme;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-colors.url = "github:misterio77/nix-colors";
    
  };

  outputs = { nixpkgs, home-manager, nix-colors, grub-theme, ... }: 
  let 
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {
          android_sdk.accept_license = true;
          allowUnfree = true;
      };
      
    };
      androidEnv = pkgs.androidenv.override { licenseAccepted = true; };
      androidComposition = androidEnv.composeAndroidPackages {
        toolsVersion = "26.1.1";
        cmdLineToolsVersion = "8.0";
        buildToolsVersions = [ "34.0.0" "30.0.3" ];
        platformVersions = [ "34" "30" ];
        extraLicenses = [
            "android-googletv-license"
            "android-sdk-arm-dbt-license"
            "android-sdk-license"
            "android-sdk-preview-license"
            "google-gdk-license"
            "intel-android-extra-license"
            "intel-android-sysimage-license"
            "mips-android-sysimage-license"       
        ];
      };
      androidSdk = androidComposition.androidsdk;
  in 
 
  {

      nixosConfigurations.smahios = nixpkgs.lib.nixosSystem  {
          specialArgs = { inherit androidSdk;} ;
          modules = [
            grub-theme.nixosModule
            ./core
           
            home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = {
 	              inherit nix-colors; inherit pkgs; inherit androidSdk;
              };
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.sn = import ./config; 

              # Optionally, use home-manager.extraSpecialArgs to pass
              # arguments to home.nix
        }
      ];
    };
  };
    
}
