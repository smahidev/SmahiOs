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
    settings = {
      "listen.owner" = "caddy";
      "listenMode" = 0660;
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
    extraConfig = ''
      listen-address = 127.0.0.1
      bind-interfaces
      domain-needed
      bogus-priv
      address = /.test/127.0.0.1
    '';
  };
  services.caddy= {
    enable = true;
    virtualHosts."*.test" = {
      extraConfig = ''
        root    * /home/sn/Codes/test/{host}/public
        encode gzip zstd
        file_server
        php_fastcgi unix//var/run/phpfpm/phpfpm-caddy.socket}
      '';
    };
  };

  # Ensure the caddy user exists
  users.users.caddy = {
    isSystemUser = true;
   
  };

  users.groups.caddy = {};

}