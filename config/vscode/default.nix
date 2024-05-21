{ pkgs, config, ...}:
{
  programs.vscode.enable = true;
  
  import = [
    ./vscode-conf.nix
    ./vscode-exts.nix
  ];
}
