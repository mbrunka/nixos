
{
  pkgs,
  lib,
  ...
}: {
  myNixOS.sddm.enable = lib.mkDefault true;
  # battery
  services.upower.enable = true;
}