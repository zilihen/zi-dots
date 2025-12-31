# Window Manager
- oxwm by tony (currently using and testing how it feels)
- hyprland (used on NixOS) 

# Font
- Jetbrains Mono (Also the Nerd font for icons)

# Future TODO
- Download and Learn Quickshell (when I have time) to configure bar and other desktop widgets

# Setting up on a new machine

Currently using nixos so just clone and run 
```sh
sudo nixos-rebuild switch --flake .#host_name
```

Will create a install script for non-nixos system but for now just symlink/rsync everything in the config folder
