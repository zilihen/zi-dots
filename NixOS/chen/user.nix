{
  inputs,
  config,
  pkgs,
  system ? pkgs.system,
  ...
}:

let
  configs = {
    hypr = "hypr";
    umbriel = "umbriel";
    foot = "foot";
    fish = "fish";
    noctalia = "noctalia";
    "starship.toml" = "starship.toml";
  };
in

{

  environment.sessionVariables = {
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
    papirus-icon-theme
    tela-icon-theme
    orchis-theme
    xfce4-whiskermenu-plugin
    xfce4-panel-profiles
   

    # basic packages that I need/want
    geteduroam
    openssl
    wget
    zip
    unzip
    microsoft-edge
    discord
    btop
    libreoffice
    xdg-utils
    satty
    qalculate-gtk
    xwayland-satellite

    # winapp stuff
    inputs.winapps.packages."${system}".winapps
    inputs.winapps.packages."${system}".winapps-launcher

    # games
    prismlauncher
    heroic
    protonplus

    # Developer tools and software that I use
    nixfmt
    jdk25
    python3
    gcc
    gdb
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
      "docker"
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

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    gcc
    gdb
  ];
  services.flatpak.enable = true;
  programs.thunar.enable = true;
  services.gvfs.enable = true;
  services.tumbler.enable = true;
  services.udisks2.enable = true;
  programs.noctalia = { 
    enable = true; 
    recommendedServices.enable = true;
  };
  programs.fish.enable = true;
  programs.umbriel.enable = true;
  programs.hyprland = {
    enable = false;
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
  virtualisation.docker.enable = true; 
  services.tailscale.enable = true;
}
