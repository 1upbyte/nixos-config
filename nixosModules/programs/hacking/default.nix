# Various hacking utlities
{ pkgs, ... }: {
  imports = [
    #./devious-winrm.nix
    #./burpsuite.nix
  ];
  environment.systemPackages = with pkgs; [
   nmap
   rusthound-ce
   bloodhound-ce
   ffuf
   python314Packages.impacket
   hashcat
   kerbrute
   netexec
   python314Packages.bloodyad
   sqlmap
   john
  ];

}
