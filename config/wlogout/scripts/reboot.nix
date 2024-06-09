{ pkgs }:

pkgs.writeShellScriptBin "hypr-reboot" ''
  #!/bin/bash
  sleep 0.5
  systemctl reboot
''