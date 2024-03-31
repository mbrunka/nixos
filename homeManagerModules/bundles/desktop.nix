{
  pkgs,
  config,
  inputs,
  lib,
  ...
}: {

  options = {
    myHomeManager.startupScript = lib.mkOption {
      default = "";
      description = ''
        Startup script
      '';
    };
  };

  config = {
    myHomeManager.bundles.general.enable = lib.mkDefault true;
    myHomeManager.zathura.enable = lib.mkDefault true;
    myHomeManager.rofi.enable = lib.mkDefault true;
    myHomeManager.kitty.enable = lib.mkDefault true;

    myHomeManager.gtk.enable = lib.mkDefault true;

    qt.enable = true;
    qt.platformTheme = "gtk";
    qt.style.name = "adwaita-dark";

    home.sessionVariables = {
      QT_STYLE_OVERRIDE = "adwaita-dark";
    };

    services.udiskie.enable = true;

    xdg.mimeApps.defaultApplications = {
      "text/plain" = ["nvim.desktop"];
      "application/pdf" = ["zathura.desktop"];
      "image/*" = ["imv.desktop"];
      "video/png" = ["mpv.desktop"];
      "video/jpg" = ["mpv.desktop"];
      "video/*" = ["mpv.desktop"];
    };

    programs.imv = {
      enable = true;
      settings = {
        options.background = "${config.colorScheme.colors.base00}";
      };
    };

    services.mako = {
      enable = true;
      backgroundColor = "#${config.colorScheme.colors.base01}";
      borderColor = "#${config.colorScheme.colors.base0E}";
      borderRadius = 5;
      borderSize = 2;
      textColor = "#${config.colorScheme.colors.base04}";
      defaultTimeout = 10000;
      layer = "overlay";
    };

    home.packages = with pkgs; [
      polkit
      polkit_gnome
      lxsession
      pavucontrol

      adwaita-qt
      libnotify

      ripdrag
      mpv
      zathura

      lm_sensors

      cm_unicode

      virt-manager

      wezterm
      kitty

      onlyoffice-bin
      easyeffects
      gegl
    ];
  };
}
