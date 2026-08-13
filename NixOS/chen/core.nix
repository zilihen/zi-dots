{
  inputs,
  pkgs,
  ...
}:

{
  # Security is good
  security = {
    polkit.enable = true;
  };

  hardware = {
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config.common.default = [ "gtk" ];
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-wlr
    ];
  };

  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  services.upower.enable = true;
  services.blueman.enable = true;
  services.printing = {
    enable = true;
  };
  services.avahi = {
    enable = true;
    nssmdns4 = true;
  };

  # Sounds is good
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    wireplumber.enable = true;
    jack.enable = true;
  };

  services.displayManager.noctalia-greeter.enable = true;

  # X-Server stuff, not really needed therefore can comment everything below out
  services.libinput.enable = true;
  services.libinput.touchpad = {
    tapping = true;
    naturalScrolling = true;
    clickMethod = "clickfinger";
    scrollMethod = "twofinger";
    accelProfile = "adaptive";
    accelSpeed = "0";
  };
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    autoRepeatDelay = 250;
    autoRepeatInterval = 25;
    # windowManager.oxwm.enable = true;
    # displayManager.startx.enable = true;
  };
}
