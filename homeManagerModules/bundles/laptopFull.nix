
{
  pkgs,
  lib,
  ...
}: {
  myHomeManager.bundles.desktop.enable = lib.mkDefault true;
  myHomeManager.bundles.desktopFull.enable = lib.mkDefault true;
  myHomeManager.bundles.laptop.enable = lib.mkDefault true;
}
