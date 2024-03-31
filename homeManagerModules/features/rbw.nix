{
  pkgs,
  inputs,
  config,
  ...
}: {
  programs.rbw = {
    enable = true;
    settings = {
      email = "michalbrunka@protonmail.com";
      # lock_timeout = 300;
      # pinentry = "curses";
    };
  };
}
