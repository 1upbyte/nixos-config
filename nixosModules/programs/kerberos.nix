{
  config,
  pkgs,
  ...
}:
{
  config = {
    security.krb5.enable = true;
    # Necessary for building Kerberos Python packages
    environment.systemPackages = [ pkgs.krb5.dev pkgs.python314Packages.gssapi ];
  };
}
