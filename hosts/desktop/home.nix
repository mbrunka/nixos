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

  myHomeManager.impermanence.directories = [
    "nixos"

    "Documents"
    "Repos"
    
  ];

  myHomeManager = {
    bundles.general.enable = true;
    bundles.desktop-full.enable = true;
    bundles.gaming.enable = true;

    firefox.enable = true;
    hyprland.enable = true;
    pipewire.enable = true;
    tenacity.enable = true;
    gimp.enable = true;

    # monitors = [
    #   {
    #     name = "eDP-2";
    #     width = 1920;
    #     height = 1080;
    #     refreshRate = 144.003006;
    #     x = 760;
    #     y = 1440;
    #   }
    # ];

    startupScript = lib.mkAfter ''
      ${pkgs.telegram-desktop}/bin/telegram-desktop &
      ${pkgs.vesktop}/bin/vesktop &
      ${pkgs.firefox}/bin/firefox &
    '';
  };

  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;

  wayland.windowManager.hyprland.settings.master.orientation = "center";

  home = {
    username = "brunek";
    homeDirectory = lib.mkDefault "/home/brunek";
    stateVersion = "22.11";

    packages = with pkgs; [
      prismlauncher
    ];
  };
}