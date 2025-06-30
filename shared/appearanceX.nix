{ config, pkgs, ... }:

{
  ############################
  ## PAQUETES DEL SISTEMA   ##
  ############################

  environment.systemPackages = with pkgs; [
    i3
    i3status
    i3lock
    dunst
    kitty
    rofi
    xdg-utils
    feh                    # fondo de pantalla
    lxappearance           # cambiar temas GTK fácilmente
    xclip                  # util para portapapeles
    pulseaudio
    pavucontrol
    xterm
    siji
    arandr
  ];

  ############################
  ## FUENTES                ##
  ############################

  fonts.packages = with pkgs; [
    dejavu_fonts
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  ############################
  ## HABILITAR X11 + I3     ##
  ############################

  services.xserver.enable = true;
  services.xserver.windowManager.i3.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.xterm.enable = true;

  # Entradas (ratón/teclado táctil, etc.)
  services.xserver.libinput.enable = true;

  # AutoLogin opcional
  services.xserver.displayManager.autoLogin = {
    enable = false;
    user = "odbk";
  };
}
