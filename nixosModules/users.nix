{ config, pkgs, username, ... }:
{
  users = {
    defaultUserShell = pkgs.bash;
    users.${username} = {
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
