{
  inputs,
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./user.nix
    ./core.nix
    # ./vm.nix
  ];
}
