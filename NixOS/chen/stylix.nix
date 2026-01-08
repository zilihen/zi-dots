{
  config,
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  stylix = {
    enable = true;
    stylix.cursor.packages = pkgs.bibata-cursors; 
    stylix.cursor.name = "Bibata-Modern-Classic";
  };
}