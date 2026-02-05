_: {
  imports = [
    ./chromium.nix
    ./foot.nix
    ./bat.nix
    ./git.nix
    ./yazi.nix
    ./mpv.nix
    ./bash.nix
    ./zoxide.nix
    ./plasma.nix
  ];
  programs.nix-index.enable = true;
}
