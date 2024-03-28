{
  pkgs,
  inputs,
  config,
  ...
}: {
  programs.rbw = {
    enable = true;
    settings = {
      email = "michaelbrunka@gmail.com";
      # lock_timeout = 300;
      #pinentry = "curses";
    };
  };
}
