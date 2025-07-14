{ pkgs, unstablePkgs, ... }:

{
  environment.systemPackages = (with pkgs; [
    wget
    tmux
    xfce.thunar
    gvfs
    alacritty
    foot
    firefox
    openvpn
    chromium
    telegram-desktop
    git
    networkmanagerapplet
    killall
    geany
    wireplumber
    helvum
  ]) ++
  (with unstablePkgs; [
    neovim
    # Añade más si quieres desde nixpkgs-unstable
  ]);
}
