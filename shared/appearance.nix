{ config, pkgs, ... }:

{
  ############################
  ## PAQUETES DEL SISTEMA   ##
  ############################

  environment.systemPackages = with pkgs; [
    hyprland
    waybar
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
    dejavu_fonts
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

  ############################
  ## FUENTES                ##
  ############################

  fonts.packages = with pkgs; [ dejavu_fonts ];

  ############################
  ## OPCIONAL: TOUCH VMWARE ##
  ############################

  # Si usas VMware y necesitas video driver específico:
  # Puedes probar con virtio o dejarlo fuera con Wayland
  # (la mayoría de sesiones Wayland funcionan sin config de driver)
}
