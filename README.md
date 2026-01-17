# Zi's Dots
I currently run NixOS. Yep went back to nix, found it a bit more convenience to set up. 

I currently use Cosmic DE, I will probably create a quickshell config at some point in the future for hyprland but right now Cosmic will do. 

> [!note] 
> I do not use home-manager for my setup, I have used it before and found it very frustrating to use. Instead, I use hjem to manage all my dots files stored in `config` directory which are symlinked by their respective directory in `~/.config`. This makes it easy to set up the configurations in other distro without using home-manager and nix.


# Installation 

Make sure you have `nix-command` and `flakes` installed on your system. Edit `/etc/nixos/configuration.nix` and add.

```nix
nix.settings.experimental-features = ["nix-command" "flakes"];
```

Then clone this repo

```sh
git clone https://github.com/zilihen/zi-dots.git
```

You may want to edit certain things in the `NixOS` directory and `flake.nix` file. 

Things you may want to change:
- Delete both `laptop.nix` and `desktop.nix` then put your desired configuration file for your system. Make sure to edit `flake.nix` to import that file accordingly.
- Change the hostname in `flake.nix` to yours by editing the line that says something along the line `nixosConfigurations.*`, then change the `*` to your desired hostname, make sure it matches with your `networking.hostName` that you have set.
- Create a folder with your username then put the packages and programs that you want in there and again, make sure to edit `flake.nix` accordingly. 
- Delete certain configuration for program that you may not use in `config` folder.
These are things that I would do but you can do whatever you want. If you wish to use home-manager just follow the instructions on their github page to setup. \br

Then when you are finish, run:

```sh
sudo nixos-rebuild switch --impure --flake .#host_name
```
Note: The `--impure` flag is there if you are importing a file outside of where the `flake.nix` is stored, so outside this repo. This is normally the case when you are importing the `hardware-configuration.nix` file stored at `/etc/nixos/` (which I do) since that file is unique to the machine you are running on. But you can also just copy that file ino this repo then run the above command without the `--impure` flag.

## Other Distros

For other distros, it is really just install your desired packages and programs then symlink everything in the config folder. I will not be creating an install script for other distro (I'm too lazy). 

```sh
cd ~/zi-dots/config
ln -sf "$(pwd)/oxwm" ~/.config/oxwm &
ln -sf "$(pwd)/wezterm" ~/.config/wezterm &
ln -sf "$(pwd)/fish" ~/.config/fish &
ln -sf "$(pwd)/dunst" ~/.config/dunst &
ln -sf "$(pwd)/starship.toml" ~/.config/starship.toml
```
Note: for st and dmenu, you will need to `cd` into them and build them with `sudo make clean install`. I think this is also the case for NixOS, I'm not too sure since I don't use X11 window manager anymore except when testing oxwm by tony on my Arch system. They are just there.
