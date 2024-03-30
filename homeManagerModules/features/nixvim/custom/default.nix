{
  pkgs,
  system,
  inputs,
  config,
  lib,
  myLib,
  ...
}: let
  cfg = config.myNvim;

  # Taking all modules in ./features and adding enables to them
  plugins =
    myLib.extendModules
    (name: {
      extraOptions = {
        myNvimPlugins.${name}.enable = lib.mkEnableOption "enable my ${name} configuration";
      };

      configExtension = config: (lib.mkIf cfg.${name}.enable config);
    })
    (myLib.filesIn ./myPlugins);
in {
  imports =
    []
    ++ plugins;
}

