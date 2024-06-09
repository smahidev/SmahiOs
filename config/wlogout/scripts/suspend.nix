{ pkgs }:

pkgs.writeShellScriptBin "hypr-suspend" ''
  #!/bin/bash
  sleep 0.5
  systemctl suspend
''