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
    myHomeManager.zathura.enable = lib.mkDefault true;
    myHomeManager.kitty.enable = lib.mkDefault true;

    myHomeManager.gtk.enable = lib.mkDefault true;

    home.file = {
      ".local/share/rofi/rofi-bluetooth".source = "${pkgs.rofi-bluetooth}";

      ".local/share/wal-telegram".source = builtins.fetchGit {
        url = "https://github.com/guillaumeboehm/wal-telegram";
        rev = "47e1a18f6d60d08ebaabbbac4b133a6158bacadd";
      };
    };

    qt.enable = true;
    qt.platformTheme = "gtk";
    qt.style.name = "adwaita-dark";

    home.sessionVariables = {
      QT_STYLE_OVERRIDE = "adwaita-dark";
    };

    services.udiskie.enable = true;

    xdg.mimeApps.defaultApplications = {
      "text/plain" = ["neovide.desktop"];
      "application/pdf" = ["zathura.desktop"];
      "image/*" = ["imv.desktop"];
      "video/png" = ["mpv.desktop"];
      "video/jpg" = ["mpv.desktop"];
      "video/*" = ["mpv.desktop"];
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

    ];
  };
}
