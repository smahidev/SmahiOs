{ config, lib, pkgs, ...}:

{
   environment.systemPackages = [
    (pkgs.php.buildEnv {
       extensions = ({ enabled, all }: enabled ++ (with all; [
        xdebug
      ]));
      extraConfig = ''
        xdebug.mode=debug
      '';
    })
  ];

   services.phpfpm.pools."caddy" = {
    user = "caddy";
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


  services.caddy= {
    enable = true;
    virtualHosts."localhost" = {
      extraConfig = ''
        root    * /home/sn/Codes/teamify/public
        encode gzip zstd
        file_server
        php_fastcgi unix/${config.services.phpfpm.pools.caddy.socket}
      '';
    };
  };


}