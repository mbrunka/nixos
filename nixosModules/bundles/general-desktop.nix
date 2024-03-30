{
  pkgs,
  lib,
  ...
}: {
  myNixOS.sddm.enable = lib.mkDefault true;
  myNixOS.xremap-user.enable = lib.mkDefault true;
  myNixOS.system-controller.enable = lib.mkDefault false;
  myNixOS.virtualisation.enable = lib.mkDefault true;

  # English system with Polish locale
  time.timeZone = "Europe/Warsaw";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "pl_PL.UTF-8";
  };

  # Enable sound with pipewire.
  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  fonts.packages = with pkgs; [
    (pkgs.nerdfonts.override {fonts = ["JetBrainsMono" "SpaceMono" "FiraMono"];})
    cm_unicode
    corefonts
  ];

  fonts.enableDefaultPackages = true;
  fonts.fontconfig = {
    defaultFonts = {
      monospace = ["FiraMono Nerd Font Mono"];
      sansSerif = ["FiraMono Nerd Font"];
      serif = ["FiraMono Nerd Font"];
    };
  };

  # battery
  # services.upower.enable = true;
}
