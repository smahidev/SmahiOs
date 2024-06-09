{ pkgs, config, ...}:
{
  programs.vscode.enable = true;
  
  imports = [
    ./vscode-conf.nix
    ./vscode-exts.nix
  ];
}
