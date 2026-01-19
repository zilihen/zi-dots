# Zi's Dots &nbsp; [![bluebuild build badge](https://github.com/zilihen/zi-dots/actions/workflows/build.yml/badge.svg)](https://github.com/zilihen/zi-dots/actions/workflows/build.yml)

This repo pertains to NixOS and Fedora Atomic Desktop. I currently use both setup. I use Cosmic DE as my main desktop environment on both system. I may create a quickshell in the future for hyprland but for now Cosmic will do.



> [!note] 
> I do not use home-manager for my NixOS setup, I have used it before and found it very frustrating to use. Instead, I use hjem to manage all my dots files stored in `config` directory which are symlinked by their respective directory in `~/.config`. This makes it easy to set up the configurations in other distro without using home-manager and nix.


# Installation 

## NixOS
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
- Change the hostname in `flake.nix` to yours by editing the line that says something along the line `nixosConfigurations.*`, then change the `*` to your desired hostname. 
- Create a folder with your username then put the packages and programs that you want in there and again, make sure to edit `flake.nix` accordingly. 
- Delete any configuration for programs that you may not use in `config` folder.

These are things that I would do but you can do whatever you want. If you wish to use home-manager just follow the instructions on their github page to setup. \br

Then when you are finish, run:

```sh
sudo nixos-rebuild switch --impure --flake .#host_name
```
Note: The `--impure` flag is there if you are importing a file outside of where the `flake.nix` is stored, so outside this repo. This is normally the case when you are importing the `hardware-configuration.nix` file stored at `/etc/nixos/` (which I do) since that file is unique to the machine you are running on. But you can also just copy that file ino this repo then run the above command without the `--impure` flag.

## Fedora Atomic

On a fresh install, I just build the iso image and install from there; this may require editing to `files/etc/skel` since it include my own personal base configuration which would be added to all users but that is only if I am doing a fresh install. Otherwise, install using instruction below, if already on a Fedora Atomic system. 

### Using bootc

To rebase an existing atomic Fedora installation to the latest build:

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  bootc switch ghcr.io/zilihen/zi-os:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  bootc switch --enforce-container-sigpolicy ghcr.io/zilihen/zi-os:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```

### Using rpm-ostree

To rebase an existing atomic Fedora installation to the latest build:

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/zilihen/zi-os:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/zilihen/zi-os:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```

The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in `recipe.yml`, so you won't get accidentally updated to the next major version.

> [!NOTE]
> I do not know what happen if you mix the two together. So, just to be safe once you stick with one, stay on that one.

### ISO

If build on Fedora Atomic, you can generate an offline ISO with the instructions available [here](https://blue-build.org/learn/universal-blue/#fresh-install-from-an-iso). These ISOs cannot unfortunately be distributed on GitHub for free due to large sizes, so for public projects something else has to be used for hosting.

### Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/zilihen/zi-os
```

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
