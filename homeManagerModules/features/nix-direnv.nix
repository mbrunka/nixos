{
  pkgs,
  lib,
  ...
}: {
  programs.direnv = {
    enable = true;
    enableFishIntegration = true;
    nix-direnv.enable = true;

    stdlib = ''
      export extra_dev_shell="direnv"
    '';
  };
}
