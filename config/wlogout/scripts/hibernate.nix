{ pkgs }:

pkgs.writeShellScriptBin "hypr-hibernate" ''
  #!/bin/bash
  sleep 1
  systemctl hibernate
''