{
  inputs,
  pkgs,
  ...
}:

{
  services.upower.enable = true;
  services.blueman.enable = true;

  services.printing = {
    enable = true;
    drivers = with pkgs; [
      gutenprint
      canon-cups-ufr2
      cnijfilter2
      cups-filters
    ];
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
  };

  services.libinput.enable = true;
  services.libinput.touchpad = {
    tapping = true;
    naturalScrolling = true;
    clickMethod = "clickfinger";
    scrollMethod = "twofinger";
    accelProfile = "adaptive";
    accelSpeed = "0";
  };
  
  services.displayManager.ly.enable = true;
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    autoRepeatDelay = 250;
    autoRepeatInterval = 25;
    # windowManager.oxwm.enable = true;
    # displayManager.startx.enable = true;
  };

  # services.greetd = {
  #   enable = true;
  #   settings.default_session = {
  #     user = "chen";
  #     # command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd Hyprland";
  #     command = "Hyprland";
  #   };
  # };

  # Sounds is good
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    wireplumber.enable = true;
    jack.enable = true;

  };

  # Security is good
  security = {
    polkit.enable = true;
    # pam.services.xscreensaver.enable = true;
    pam.services.hyprlock = {};
  };

  hardware = {
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true; 
    config.common.default = ["gtk"];
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
    ];
    configPackages = [ pkgs.hyprland ];
  };
}
