{
  pkgs ? import <nixpkgs> { config.allowUnfree = true; },
}:

let
  launcher = pkgs.fetchzip rec {
      url = "https://launcher.hytale.com/builds/release/linux/amd64/hytale-launcher-latest.zip";
      sha256 = "sha256-bJQwGSj7B1szXv1e7RN2VQdriSbGe+En1EQONIeLQ84="; 
      stripRoot = false;
    };

  hytale-launcher-fhs = pkgs.buildFHSEnv {
    name = "hytale-launcher-fhs";

    # depenencies needed
    targetPkgs =
      pkgs: with pkgs; [
        webkitgtk_4_1
        gdk-pixbuf
        libsoup_3
        bash
        coreutils
        glib
        gtk3
        libGL
        xorg.libX11
        xorg.libXcursor
        xorg.libXrandr
        xorg.libXinerama
        xorg.libXi
        alsa-lib
        pulseaudio
        udev
        dbus
        nss
        nspr
      ];

    runScript = pkgs.writeShellScript "wrapper" ''
      set -e 
      exec ${launcher}/* & disown
    '';
  };
in
hytale-launcher-fhs.env
