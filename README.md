# Packages being used
I normally just download EndeavourOS so a lot of the package is already pre-install 
so the required ones are:

- oxwm-git; window manager by tony (currently using and testing how it feels)
- picom
- dunst
- wezterm (optional since st is inside this repo)
- fish (and starship)
- xorg-xset
- xorg-xrandr
- xscreensaver
- flameshot for screenshot
- feh for wallpaper background
- thunar (or any file manager)

# Font
- Jetbrains Mono (Also the Nerd font for icons)

# Current TODO
- Fix st not running fish shell when launched
- get volume and brightness control to work with dunst via keybinds.
- Xscreensaver for some odd reason did not work

# Setting up on a new machine

## If using nixos, just clone and run. 

```sh
sudo nixos-rebuild switch --flake .#host_name
```
Note: Nixos configuration is not ready since I might decides to drop home manager (I hate using it)

## Other Distros

Will create a install script for non-nixos system but for now just symlink/rsync everything in the config folder

### Temp way of setting up config

```sh
cd ~/zi-dots/config
ln -sf ./oxwm ~/.config/oxwm
ln -sf ./wezterm ~/.config/wezterm
ln -sf ./fish ~/.config/fish
ln -sf ./dunst ~/.config/dunst/
ln -sf ./starship.toml ~/.config/starship.toml
```
For st and dmenu, cd into them and build them with `sudo make clean install`