{
  pkgs,
  inputs,
  ...
}:
{
  imports = [ inputs.agenix.nixosModules.default ];
  age.identityPaths = [
    "/persist/etc/ssh/ssh_host_ed25519_key"
    "/etc/ssh/ssh_host_ed25519_key"
  ];
  
  age.secrets.tailscale = {
    file = ../../secrets/tailscale.age;
    mode = "440";
    group = "users";
  };

  age.secrets.passwd-pixel = {
    file = ../../secrets/passwd-pixel.age;
    mode = "440";
    group = "users";
  };
  environment.systemPackages = [
    inputs.agenix.packages.${pkgs.system}.default
    pkgs.age-plugin-yubikey
  ];

  services.pcscd.enable = true;
}
