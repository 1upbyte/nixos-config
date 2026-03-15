{ config, pkgs, ... }:
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        # 'dbus-run-session' ensures Plasma has a bus to talk to the GPU/Display
        command = "${pkgs.dbus}/bin/dbus-run-session ${pkgs.greetd}/bin/agreety --cmd start-hyprland";
        user = "greeter";
      };
    };
  };

  # Essential: Give the greeter user hardware access
  users.users.greeter.extraGroups = [ "video" "render" ];

  # Force the 3D driver to load for the greeter
  systemd.services.greetd.serviceConfig = {
    Environment = [
      "WLR_NO_HARDWARE_CURSORS=1" # Common fix for black screens on virtual GPUs
      "WLR_RENDERER=gles2"        # More stable for VirGL
    ];
  };
}
