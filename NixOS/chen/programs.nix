{ 
  programs.wezterm.enable = true;
  programs.fish.enable = true;
  
  programs.hyprland.enable = true;
  programs.hyprland.withUWSM = true;

  programs.git = {
    enable = true;
    config = [
      {
      user.name = "zi";
      user.email = "jasonchen7766@gmail.com";
      }
    ];
  };
}