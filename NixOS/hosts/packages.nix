{ inputs, pkgs, ... }:

{
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
		xbindkeys
    udiskie
  ];
}