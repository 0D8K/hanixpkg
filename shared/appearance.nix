{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
    ];

  environment.systemPackages = with pkgs; [
    i3
    i3status
    i3lock
    dmenu
    xss-lock
    nitrogen
    rofi
  ];


  ############################
  ## ENTORNO GRÁFICO        ##
  ############################
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "vmware" ];
  services.xserver.dpi = 192;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.windowManager.i3.enable = true;
  services.displayManager.defaultSession = "none+i3";

  # Soporte de fuentes, para menús etc..
  fonts.packages = with pkgs; [ dejavu_fonts ];

}
