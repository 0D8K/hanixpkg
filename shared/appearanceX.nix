{ config, pkgs, ... }:

let
  # Ruta local al wallpaper. Asegúrate de que exista en tu flake o sistema.
  wallpaperSrc = ./images/fondorc1.png;
in
{
  ###########################
  ## WALLPAPER GLOBAL     ##
  ###########################

  # Agrega una regla para esqueleto de nuevos usuarios (no afecta usuarios actuales)  
  environment.etc."skel/.config".source = ./.config;  

  # Ajusta el fondo con fill
  services.xserver.displayManager.sessionCommands = ''
    feh --bg-fill ~/.config/wallpaper.png
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
  fonts = {
    enableDefaultFonts = true;
    packages = with pkgs; [
      dejavu_fonts
      material-design-icons
      (nerdfonts.override { fonts = [ "JetBrainsMono" "Iosevka" ]; })
    ];
    
    fontconfig = {
      enable = true;
      # Opcional: puedes definir fuentes por defecto más específicas
      defaultFonts = {
        monospace = [ "JetBrainsMono Nerd Font" "Iosevka Nerd Font" "DejaVu Sans Mono" ];
        sansSerif = [ "DejaVu Sans" ];
        serif = [ "DejaVu Serif" ];
      };
    };
  };

  ############################
  ## HABILITAR X11 + I3     ##
  ############################

  services.xserver.enable = true;
  services.xserver.windowManager.i3.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.xterm.enable = true;
  services.xserver.dpi = 192;

  # Entradas (ratón/teclado táctil, etc.)
  services.libinput.enable = true;

  ############################
  ## AUTOLOGIN (opcional)   ##
  ############################

  services.displayManager.autoLogin = {
    enable = false;  # Cámbialo a true si quieres autologin
    user = "odbk";   # Asegúrate que el usuario exista
  };
}

