{
  config,
  ...
}:
{
  config = {
    programs.tmux= {
      enable = true;
      keyMode = "vi";
      historyLimit = 10000;
      clock24 = true;
      extraConfig = "set -g mouse on";
    };
  };
}
