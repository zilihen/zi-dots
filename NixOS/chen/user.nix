{
  inputs,
  config,
  pkgs,
  ...
}:

let
  configs = {
    hypr = "hypr";
    oxwm = "oxwm";
    foot = "foot";
    fish = "fish";
    noctalia = "noctalia";
    "starship.toml" = "starship.toml";
  };
in

{
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
  };

  users.users.chen = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "libvirtd"
    ];
    packages = with pkgs; [

      # cursors, and theme
      adwaita-icon-theme

      # basic packages that I need/want
      nwg-look
      electron
      wget
      zip
      unzip
      udiskie
      bluez
      bluez-tools
      wl-clipboard
      brightnessctl
      pavucontrol
      playerctl
      microsoft-edge
      discord
      btop
      libreoffice

      # games
      prismlauncher
      heroic
      protonplus

      # Developer tools and software that I use
      nixfmt
      jdk
      gcc
      vscode

      foot
      starship
    ];
  };

  hjem.users.chen = {
    user = "chen";
    directory = "/home/chen";
    xdg.config.files = builtins.mapAttrs (name: subpath: {
      source = "/home/chen/zi-dots/config/${subpath}";
      clobber = true;
    }) configs;
  };

  services.flatpak.enable = true;
  programs.noctalia = { 
    enable = true; 
    recommendedServices.enable = true;
  };
  programs.fish.enable = true;
  programs.hyprland = {
    enable = true;
    withUWSM = false;
    xwayland.enable = true;
  };
  programs.git = {
    enable = true;
    config = [
      {
        user.name = "zi";
        user.email = "jasonchen7766@gmail.com";
      }
    ];
  };
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = false;
    gamescopeSession.enable = true;
    extraPackages = with pkgs; [ bibata-cursors ]; # Add kdePackages.breeze into steam fhs environment to fix cursor problem
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
  };
}
