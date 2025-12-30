{ inputs, pkgs, ... }:

{
  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = false;
      gamescopeSession.enable = true;
      extraCompatPackages = [ pkgs.proton-ge-bin ];
    };

    gamescope = {
      enable = true;
      capSysNice = true;
      args = [
        "--rt"
        # "--expose-wayland"
      ];
    };
  };

  fonts.packages = with pkgs; [
    noto-fonts-color-emoji
    noto-fonts-cjk-sans
    # font-awesome
    jetbrains-mono
    nerd-fonts.jetbrains-mono
    # maple-mono.NF
  ];

  # package to be install on all hosts
  environment.systemPackages = with pkgs; [
    nixfmt-rfc-style
    wget
    zip
    unzip
    xrandr
    udiskie
  ];

  # programs to be enable across all hosts
  programs = {
    thunar.enable = true;
  };
}