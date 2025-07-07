{ config, pkgs, ... }:

{
  ############################
  ## PAQUETES DEL SISTEMA   ##
  ############################

  environment.systemPackages = with pkgs; [
    greetd.tuigreet
    hyprland
    waybar
    hyprpaper
    wofi
    wlr-randr
    dunst
    kitty
    rofi-wayland
    xdg-utils
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    nerdfonts
    siji
  ];

  ############################
  ## FUENTES                ##
  ############################
  fonts.packages = with pkgs; [
    dejavu_fonts
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  ############################
  ## HABILITAR HYPRLAND     ##
  ############################

  programs.hyprland.enable = true;

  # Portales para compartir pantalla, notificaciones, etc.
  xdg.portal.enable = true;
  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-gtk
  ];

  services.greetd.enable = true;

}
