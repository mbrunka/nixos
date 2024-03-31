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

  myHomeManager.zsh.enable = lib.mkDefault true;
  myHomeManager.lf.enable = lib.mkDefault true;
  myHomeManager.yazi.enable = lib.mkDefault true;
  myHomeManager.nix-extra.enable = lib.mkDefault true;
  myHomeManager.bottom.enable = lib.mkDefault true;
  myHomeManager.nix-direnv.enable = lib.mkDefault true;
  myHomeManager.btop.enable = lib.mkDefault true;
  myHomeManager.bashFish.enable  = lib.mkDefault false;

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    git
    neovim
    wget
    curl

    nil
    nixd
    pistol
    file
    git
    p7zip
    unzip
    zip
    imagemagick
    killall

    lf
    eza
    fd
    zoxide
    bat
    du-dust
    ripgrep
    pfetch
    lazygit

    wget

    tree-sitter

    gh
  ];

  home.sessionVariables = {
    FLAKE = "${config.home.homeDirectory}/nixos";
  };
}
