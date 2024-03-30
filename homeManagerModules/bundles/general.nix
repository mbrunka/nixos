{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: {
  imports = [
    inputs.nix-colors.homeManagerModules.default
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      experimental-features = "nix-command flakes";
    };
  };

  programs.home-manager.enable = true;
  
  home.packages = with pkgs; [

  ];

  home.sessionVariables = {
    FLAKE = "${config.home.homeDirectory}/nixos";
  };
}
  
