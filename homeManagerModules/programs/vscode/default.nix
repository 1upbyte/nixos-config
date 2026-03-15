{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = true;
    package = pkgs.vscode-fhs;
    profiles.default = {
        keybindings = ./keybindings.json;
        userSettings = builtins.fromJSON (builtins.readFile ./settings.json);
    };
  };
}
