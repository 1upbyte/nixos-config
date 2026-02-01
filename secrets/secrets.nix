let
  doraemon = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFie2zJrIcoQteTSAoxIgh5BtkiiPM9p+zlR5DJ2QLjh";
  dorami = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILNkLMLafZgz6REfc5oWt/3M0windSHp99q/Jnxu7pB5";
  pixel = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBaomu/YMaZwwAuu2F30/ullFW320jgafzIFgIVVx7FW";
  users = [ doraemon dorami ];
  systems = [ doraemon dorami ];
in
{
  "tailscale-pixel.age".publicKeys = [ pixel ];
  "passwd-pixel.age".publicKeys = [ pixel ];
}
