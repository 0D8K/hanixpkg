{ config, pkgs, ... }:

let
  # Ruta local al wallpaper. Asegúrate de que exista en tu flake o sistema.
  wallpaperSrc = ./images/fondorc1.png;
in
{
  ###########################
  ## WALLPAPER GLOBAL     ##
  ###########################

  # Copia el wallpaper a una ubicación accesible para todos
  environment.etc."wallpapers/default.jpg".source = wallpaperSrc;

  # Agrega una regla para esqueleto de nuevos usuarios (no afecta usuarios actuales)
  environment.etc."skel/.config/wallpaper.jpg".source = wallpaperSrc;

  # Ajusta el fondo con fill
  services.xserver.displayManager.sessionCommands = ''
    feh --bg-fill /etc/wallpapers/default.jpg
  '';

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
    xclip                  # útil para el portapapeles
    pulseaudio
    pavucontrol
    xterm
    siji
    arandr
    polybar
    picom
    xorg.xdpyinfo
  ];

  ############################
  ## FUENTES                ##
  ############################

  fonts.packages = with pkgs; [
    dejavu_fonts
    material-design-icons
    (nerdfonts.override { fonts = [ "JetBrainsMono" "Iosevka" ]; })
  ];

  ############################
  ## HABILITAR X11 + I3     ##
  ############################

  services.xserver.enable = true;
  services.xserver.windowManager.i3.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.xterm.enable = true;
  services.xserver.dpi = 192;

  # Entradas (ratón/teclado táctil, etc.)
  services.xserver.libinput.enable = true;

  ############################
  ## AUTOLOGIN (opcional)   ##
  ############################

  services.xserver.displayManager.autoLogin = {
    enable = false;  # Cámbialo a true si quieres autologin
    user = "odbk";   # Asegúrate que el usuario exista
  };
}

