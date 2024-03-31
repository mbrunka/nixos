{
  inputs,
  outputs,
  pkgs,
  lib,
  ...
}: {
  imports = [outputs.homeManagerModules.default];

  programs.git.userName = "MBrunka";
  programs.git.userEmail = "michaelbrunka@gmail.com";

  myHomeManager = {
    bundles.desktopFull.enable = true;
    bundles.wayland.enable = true;
    # bundles.gaming.enable = true;

    firefox.enable = true;
    vscode.enable = true;

    hyprland.enable = true;
    rofi.enable = true;

    monitors = [
      {
        name = "DP-3";
        width = 3840;
        height = 2160;
        refreshRate = 59.99700;
	      scale = 1;
        x = 0;
        y = 0;
      }
    ];

    #startupScript = lib.mkAfter ''
    #  ${pkgs.firefox}/bin/firefox &
    #'';
  };

  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;

  #wayland.windowManager.hyprland.settings.master.orientation = "center";

  home = {
    username = "brunek";
    homeDirectory = lib.mkDefault "/home/brunek";
    stateVersion = "23.11";

    packages = with pkgs; [
      #prismlauncher
      brave
    ];
  };
}
