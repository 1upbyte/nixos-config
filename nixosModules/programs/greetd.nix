{
  config,
  pkgs,
  ...
}:
{
  config = {
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd}/bin/agreety --cmd startplasma-wayland";
        };
      };
    };
  };
}
