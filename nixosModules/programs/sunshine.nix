{
  config,
  ...
}:
{
  config = {
    services.sunshine = {
      enable = true;
      capSysAdmin = true;
      autoStart = true;
    };
  };
}
