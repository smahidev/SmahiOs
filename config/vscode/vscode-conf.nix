{ config, pkgs, ...}:
{
     programs.vscode.userSettings = { 
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
      "editor.fontFamily"= "JetBrainsMono Nerd Font Propo";
      "editor.fontLigatures" = true;
      "editor.minimap.enabled" = false;
      "workbench.iconTheme" = "material-icon-theme";
	  "dart.checkForSdkUpdates" = false;
	  "debug.toolBarLocation" = "commandCenter";
    };
    
}
