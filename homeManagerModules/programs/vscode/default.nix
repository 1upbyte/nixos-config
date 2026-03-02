{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = true;
    package = pkgs.vscode-fhs;
    profiles.main = {
        keybindings = ./keybindings.json;
        userSettings = builtins.fromJSON (builtins.readFile ./settings.json);
    };
  };
}
