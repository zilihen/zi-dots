{
  inputs,
  config,
  pkgs,
  ...
}:

{
  virtualisation.waydroid.enable = true;
  virtualisation.docker.enable = true;
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
