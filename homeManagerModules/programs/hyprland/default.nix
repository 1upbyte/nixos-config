{ pkgs, ... }: {
  imports = [
    ./envs.nix
    ./bindings.nix
    ./looknfeel.nix
    ./autostart.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true; 
    # systemd integration conflicts with uswm, per wiki
    systemd.enable = false;
    settings = {
      "$terminal" = "kitty";
      "$browser" = "helium --new-window --ozone-platform=wayland";
      
      input.touchpad = {
        natural_scroll = true;
        scroll_factor = 0.6;
        clickfinger_behavior = true;
      };

      follow_mouse = 2;
      resize_on_border = true;
    };      
  };
}
