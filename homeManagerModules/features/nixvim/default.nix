{
  pkgs,
  inputs,
  config,
  ...
}: {
  programs.nixvim = {
    enable = true;

    colorschemes.gruvbox.enable = true;

    options = {
      number = true;
      relativenumber = true;
      
      shiftwidth = 2;
    };
    
    globals.mapleader = " ";
    
    plugins = {
      lightline.enable = true;

    };
  };
}

