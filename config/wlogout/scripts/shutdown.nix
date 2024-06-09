{ pkgs }:

pkgs.writeShellScriptBin "hypr-shutdown" ''
  #!/bin/bash
  sleep 0.5
  systemctl poweroff
''