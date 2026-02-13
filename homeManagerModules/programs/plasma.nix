{ inputs, ... }:
 {
  imports = [ inputs.plasma-manager.homeModules.plasma-manager ];
  programs.plasma = {
    enable = true;
    overrideConfig = true;
    workspace = {
      wallpaper = /etc/nixos/assets/majora-wallpaper.png;
    };
  };
}
