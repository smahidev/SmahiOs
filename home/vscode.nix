{ pkgs, config, ...}:
{
  programs.vscode = {
    enable = true;
    userSettings = { 
	    "debug.openDebug" = "openOnDebugBreak";

	    "debug.internalConsoleOptions" =  "openOnSessionStart";

	    "[dart]"= {
		    "editor.formatOnSave"= true;
		    "editor.formatOnType"= true;
		    "editor.rulers"= [80];
		    "editor.selectionHighlight"= false;
		    "editor.suggestSelection"= "first";
		    "editor.tabCompletion" = "onlySnippets";
		    "editor.wordBasedSuggestions" = "off";
	    };
      "window.titleBarStyle" = "custom"; 
      "editor.fontFamily"    = "'JetBrainsMono Nerd Font', 'monospace'";
      "editor.fontLigatures" = true;
      "editor.minimap.enabled" = false;
      "workbench.iconTheme" = "material-icon-theme";
    };
    extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      jnoortheen.nix-ide
      pkief.material-icon-theme
      dart-code.dart-code
      dart-code.flutter
    ];
  };
}
