
{
  pkgs,
  config,
  inputs,
  lib,
  ...
}: {
  config = {
    myHomeManager.zathura.enable = lib.mkDefault true;
    myHomeManager.rofi.enable = lib.mkDefault true;
    myHomeManager.kitty.enable = lib.mkDefault true;

    myHomeManager.gtk.enable = lib.mkDefault true;

    home.file = {
      ".local/share/rofi/rofi-bluetooth".source = "${pkgs.rofi-bluetooth}";

      ".local/share/wal-telegram".source = builtins.fetchGit {
        url = "https://github.com/guillaumeboehm/wal-telegram";
        rev = "47e1a18f6d60d08ebaabbbac4b133a6158bacadd";
      };
    };

    home.packages = with pkgs; [
      upower
    ];
  };
}