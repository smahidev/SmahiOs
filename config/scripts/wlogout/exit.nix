{pkgs}:

pkgs.writeShellScriptBin "hypr-exit" ''
  #!/bin/bash 
  sleep 0.5 
  killall -9 Hyprland sleep 2
''
