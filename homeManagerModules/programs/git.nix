{ config, ... }:
{
  programs.git = {
    enable = true;
    userName = "1upbyte";
    userEmail = "pablo@pablocomino.com";
    # signing = {
      # key = "~/.ssh/${config.programs.ski.settings.roles.sign.target}.pub";
      # signByDefault = true;
    # };
    # iniContent.gpg.format = "ssh";
  };
}
