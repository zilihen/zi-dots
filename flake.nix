{
  description = "NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable";

    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hardware = { 
      url = "github:NixOS/nixos-hardware";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: {
    nixosConfigurations.nixos-desktop = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs; };
      modules = [
        inputs.hjem.nixosModules.default
        ./NixOS/desktop.nix
        ./NixOS/chen
      ];
    };
    nixosConfigurations.nixos-laptop = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs; };
      modules = [
        inputs.hjem.nixosModules.default
        inputs.hardware.nixosModules.framework-intel-core-ultra-series1
        ./NixOS/laptop.nix
        ./NixOS/chen
      ];
    };
  };
}
