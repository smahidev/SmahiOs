{ config, pkgs, ...}:
{
  programs.vscode.extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      pkief.material-icon-theme
      dart-code.dart-code
      dart-code.flutter
    ];
}
