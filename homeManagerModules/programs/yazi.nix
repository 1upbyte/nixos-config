_: {
  programs.yazi = {
    enable = true;
    shellWrapperName = "y";
    enableBashIntegration = true;
    settings = {
      manager = {
        show_hidden = true;
        sort_dir_first = true;
      };
    };
  };
}
