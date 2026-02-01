{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./programs
    ./catppuccin.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = "pablo";
    homeDirectory = "/home/pablo";

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "25.11";
  };


  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;

    gpg = {
      enable = true;
      homedir = "${config.xdg.dataHome}/gnupg";
    };

    btop.enable = true;
  };

  home.packages = with pkgs; [
    sioyek
    ripgrep
    jellyfin-mpv-shim
    pavucontrol
    p7zip
    # obsidian
    # julia
  ];

  fonts.fontconfig.enable = true;
}
