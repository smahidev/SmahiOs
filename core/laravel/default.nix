{ config, lib, pkgs, ...}:

{
   environment.systemPackages = with pkgs; [
    php83Packages.composer
    dig
    (php83.buildEnv {
       extensions = ({ enabled, all }: enabled ++ (with all; [
        xdebug
      ]));
      extraConfig = ''
        xdebug.mode=debug
      '';
    })
  ];

   services.phpfpm.pools.caddy = {
    user = config.services.caddy.user;
    settings = {
      "listen.owner" = config.services.caddy.user;
      "pm" = "dynamic";
      "pm.max_children" = 32;
      "pm.max_requests" = 500;
      "pm.start_servers" = 2;
      "pm.min_spare_servers" = 2;
      "pm.max_spare_servers" = 5;
      "php_admin_value[error_log]" = "stderr";
      "php_admin_flag[log_errors]" = true;
      "catch_workers_output" = true;
    };
    phpEnv."PATH" = lib.makeBinPath [ pkgs.php ];
  };

  services.dnsmasq = {
    enable = true;
    settings = {
      address = [ "/test/127.0.0.1" ];
    };
  }; 

  # ...
  services.caddy = {
    enable = true;
    virtualHosts."*.test" = {
     extraConfig = ''
        root * /var/www/{host}/public
        file_server
        encode gzip zstd
        php_fastcgi unix//${config.services.phpfpm.pools.caddy.socket}
      '';
    }; 
  };
 
}