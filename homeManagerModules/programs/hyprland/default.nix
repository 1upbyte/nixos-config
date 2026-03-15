{ pkgs, ... }: {
  wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true; 
      # systemd integration conflicts with uswm, per wiki
      systemd.enable = false;
    };
}
