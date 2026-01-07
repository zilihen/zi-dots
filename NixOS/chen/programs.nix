{
  inputs,
  config,
  pkgs,
  ...
}:

{ 
  programs.thunar.enable = true;
  programs.wezterm.enable = true;
  programs.fish.enable = true;
  programs.hyprland = { 
    enable = true;
    withUWSM = false; 
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
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
    extraCompatPackages = [ ];
  };
}
