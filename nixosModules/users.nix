{ config, pkgs, ... }:
{
  users = {
    defaultUserShell = pkgs.bash;
    users.pablo = {
      hashedPasswordFile = "${config.age.secrets.passwd-pixel.path}";
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "plugdev"
        "scanner"
        "lp"
      ];
    };
  };
}
