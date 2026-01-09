{ 
  programs.virt-manager.enable = true;
  users.gropus.libvirtd.members = ["chen"];
  virtualisation.libvirtd = { 
    enable = true;
    qemu = { 
      swtpm.enable = true
    };
  };
  virtualisation.spiceUSBRedirection.enable = true;
}