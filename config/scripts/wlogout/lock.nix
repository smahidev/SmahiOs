{ pkgs }:

pkgs.writeShellScriptBin "hypr-lock" ''
  #!/bin/bash
  sleep 0.5
  hyprlock
''