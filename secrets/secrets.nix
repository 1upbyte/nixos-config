let
  doraemon = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFie2zJrIcoQteTSAoxIgh5BtkiiPM9p+zlR5DJ2QLjh";
  mbp = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILNkLMLafZgz6REfc5oWt/3M0windSHp99q/Jnxu7pB5";
  pixel = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBaomu/YMaZwwAuu2F30/ullFW320jgafzIFgIVVx7FW";
  users = [ doraemon mbp pixel ];
in
{
  "passwd-pixel.age".publicKeys = [ pixel ];
  "passwd-mbp.age".publicKeys = [ mbp ];
  "tailscale.age".publicKeys = users;
}
