{ pkgs, ... }:

{
  xdg = {
    enable = true;

    portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-hyprland
      ];
      configPackages = [ pkgs.hyprland ];
    };

    userDirs = {
      enable = true;
      desktop = "$HOME/Desktop";
      documents = "$HOME/Documents";
      download = "$HOME/Downloads";
      pictures = "$HOME/Pictures";
      music = "$HOME/Music";
      videos = "$HOME/Videos";
    };
  };

  services.udiskie.enable = true;
  services.udiskie.tray = "always"; 

  home.packages = with pkgs; [ 
    bluez
    bluez-tools
    libgtop
    dart-sass
    wl-clipboard
    gvfs
    gtksourceview3
    libchamplain_libsoup3
    brightnessctl
    pwvucontrol
    playerctl
    spotify
    ani-cli
    microsoft-edge
    discord
    
    prismlauncher

    jdk
    cargo
    vscode
    starship
    dunst
    btop
    fish
    gh
  ];

  programs.wezterm.enable = true;

  programs.git = {
    enable = true;
    settings = {
      user.name = "zi";
      user.email = "jasonchen7766@gmail.com";
    };
  };
}
