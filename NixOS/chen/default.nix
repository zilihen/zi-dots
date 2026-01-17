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
    wezterm = "wezterm";
    fish = "fish";
    cosmic = "cosmic";
    "starship.toml" = "starship.toml";
  };
in

{
  imports = [
    ./programs.nix
    ./services.nix
    ./vm.nix
  ];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
  };

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

  xdg.icons.fallbackCursorThemes = [ "Bibata-Modern-Classic" ];

  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  fonts = {
    fontDir.enable = true;
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      jetbrains-mono
      nerd-fonts.jetbrains-mono
    ];
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

      # Cursor
      bibata-cursors

      # basic packages that I need/want
      quickshell
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
      spotify
      ani-cli
      microsoft-edge
      discord
      prismlauncher
      starship
      dunst
      btop
      libreoffice
      heroic
      docker

      # Developer tools and software that I use
      nixfmt
      wezterm
      foot
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
