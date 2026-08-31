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
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    QT_QPA_PLATFORMTHEME = "qt6ct";
    XCURSOR_THEME = "Adwaita"; 
    XCURSOR_SIZE = "24"; 
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


  environment.systemPackages = with pkgs; [ 
    # cursors, and theme
    adwaita-icon-theme
    adw-gtk3
    qt6Packages.qt6ct

    # basic packages that I need/want
    nwg-look
    electron
    wget
    zip
    unzip
    udiskie
    wl-clipboard
    brightnessctl
    playerctl
    microsoft-edge
    discord
    btop
    libreoffice
    xdg-utils
    nautilus
    satty

    # games
    prismlauncher
    heroic
    protonplus

    # Developer tools and software that I use
    nixfmt
    jdk
    python3
    gcc
    devenv
    vscode
    foot
    starship
  ];

  users.users.chen = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "libvirtd"
    ];
    packages = with pkgs; [ ];
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
    withUWSM = true;
    xwayland.enable = true;
  };
  programs.git = {
    enable = true;
    config = [
      {
        user.name = "zi";
        user.email = "hidden";
      }
    ];
  };
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = false;
    gamescopeSession.enable = true;
    extraPackages = with pkgs; [ adwaita-icon-theme ]; 
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
  };
}
