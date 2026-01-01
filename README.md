# Window Manager
- oxwm by tony (currently using and testing how it feels)

# Font
- Jetbrains Mono (Also the Nerd font for icons)

# Current TODO
- Fix st not running fish shell when launched
- get volume and brightness control to work with dunst via keybinds.
- Xscreensaver for some odd reason did not work

# Setting up on a new machine

If using nixos so just clone and run. Note: Nixos configuration is not ready since I might decides to drop home manager (I hate using it)
```sh
sudo nixos-rebuild switch --flake .#host_name
```

## Other Distros

Will create a install script for non-nixos system but for now just symlink/rsync everything in the config folder
