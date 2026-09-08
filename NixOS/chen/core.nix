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
    config.common.default = ["gtk"];
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
    configPackages = [ ];
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
  services.printing = {
    enable = true;
    drivers = [pkgs.hplip];
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

  services.displayManager.ly.enable = true;

  # services.displayManager.gdm.enable = true;

  # X-Server stuff, not really needed therefore can comment everything below out
  services.libinput.enable = true;
  services.libinput.touchpad = {
    tapping = true;
    naturalScrolling = true;
    clickMethod = "clickfinger";
    scrollMethod = "twofinger";
    accelProfile = "custom"; 
    accelStepMotion = 0.2144477506;
    accelPointsMotion = [0.000 0.307 0.615 1.077 1.539 2.002 2.505 3.208 3.910 4.613 5.315 6.018 6.720 7.423 8.125 8.828 9.530 10.233 10.935 12.387];
  };

  services.libinput.mouse = {
    accelProfile = "custom"; 
    accelStepMotion = 0.2144477506;
    accelPointsMotion = [0.000 0.307 0.615 1.077 1.539 2.002 2.505 3.208 3.910 4.613 5.315 6.018 6.720 7.423 8.125 8.828 9.530 10.233 10.935 12.387];
  };

  services.xserver = {
    enable = true;
    xkb.layout = "us";
    autoRepeatDelay = 250;
    autoRepeatInterval = 25;

    # Note to self: For xfce certain things need to be configure on fresh install: 
    # Set shortcut for application finder
    # Edit shortcut for window manager
    # import panel settings that is saved in config folder
    desktopManager.xfce.enable = true;
  };
}
