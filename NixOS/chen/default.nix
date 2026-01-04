{
  inputs,
  config,
  pkgs,
  ...
}:

{ 

  imports = [
    ./gaming.nix
    ./program.nix
    ./services.nix
    ./stylix.nix
  ]; 

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

      # font packages 
      jetbrains-mono
      nerd-fonts.jetbrains-mono

      # basic packages that I need
      nixfmt-rfc-style
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
      pwvucontrol
      playerctl
      spotify
      ani-cli
      microsoft-edge
      discord
      prismlauncher
      starship
      dunst
      btop

      # Developer tools that I use
      wezterm
      jdk
      cargo
      gcc
      vscode
      gh
    ];
  };
}