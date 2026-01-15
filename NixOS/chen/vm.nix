{pkgs, ...}: 

{ 
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["chen"];
  virtualisation.libvirtd = { 
    enable = true;
    qemu = { 
      swtpm.enable = true;
      vhostUserPackages = with pkgs; [ virtiofsd ];
    };
  };
  virtualisation.spiceUSBRedirection.enable = true;
}