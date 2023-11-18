{ config, pkgs, userDetails, desktopDetails,...}:
{
  services = {
    xserver = {
      dpi = desktopDetails.dpi;
      enable = true;
      displayManager = {
        defaultSession = "none+i3";
        autoLogin = {
          enable = true;
          user = "${userDetails.userName}";
        };
        gdm.enable = true;
      };
      windowManager.i3 = {
       	enable = true;
	      extraPackages = with pkgs; [
		      rofi
            pavucontrol
            xcolor
            xclip
            xdo
            xdotool
            xsel
            xfce.exo
            #xfce.xfce4-notifyd
            xfce.xfce4-appfinder
            firefox
	      ];
	      extraSessionCommands = ''
          xrandr --output Virtual-1 --auto
	      '';
      };

      layout = "us";
       xkbOptions = "caps:escape";

      libinput = {
	      enable = true;
	      touchpad.tapping = true;
	      touchpad.naturalScrolling = true;
	      touchpad.scrollMethod = "twofinger";
	      touchpad.disableWhileTyping = false;
	      touchpad.clickMethod = "clickfinger";
      };
    };
    gnome.gnome-keyring.enable = true;
    dbus.enable = true;
    gvfs.enable = true;
    tumbler.enable = true;
  };
  
  programs = {
    thunar = {
      enable = true;
      plugins = with pkgs.xfce;[
        thunar-archive-plugin thunar-volman thunar-media-tags-plugin
      ];
    };
    dconf.enable = true;
  };
  
 # xdg.portal = {
 #   enable = true;
 #   extraPortals = [
 #     pkgs.xdg-desktop-portal-kde
 #   ];
 # };
   
}