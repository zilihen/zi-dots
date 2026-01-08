{
  inputs,
  config,
  pkgs,
  ...
}:

let
  configs = {
    hypr = "hypr"; 
    dunst = "dunst";
    oxwm = "oxwm";
    wezterm = "qtile";
    fish = "fish"; 
    "starship.toml" = "starship.toml"; 
  };
in

{ 

  imports = [
    ./programs.nix
    ./services.nix
    # ./stylix.nix
  ]; 

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
    config.common.default = ["gtk"];
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

  users.users.chen = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
    ];
    packages = with pkgs; [ 

      # fonts, theme, and icon packages
      jetbrains-mono
      nerd-fonts.jetbrains-mono
      kdePackages.breeze
      kdePackages.breeze-gtk

      # basic packages that I need/want     
      quickshell
      nwg-look 
      wget
      zip
      unzip
      udiskie
      bluez
      bluez-tools
      libgtop
      dart-sass
      wl-clipboard
      gvfs
      gtksourceview3
      libchamplain_libsoup3
      brightnessctl
      pavucontrol
      playerctl
      spotify
      ani-cli
      microsoft-edge
      discord
      prismlauncher
      starship
      dunst
      btop

      # Developer tools and software that I use
      nixfmt-rfc-style
      wezterm
      jdk
      cargo
      gcc
      vscode
      gh
    ];
  };

  hjem.users.chen = { 
    user = "chen";
    directory = "/home/chen";
    xdg.config.files = builtins.mapAttrs (name: subpath: { 
      source = "/home/chen/zi-dots/config/${subpath}";
    }) configs; 
  };
}
