{
  pkgs,
  inputs,
  config,
  lib,
  ...
}: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      vscodevim.vim
      yzhang.markdown-all-in-one
      jnoortheen.nix-ide
      github.copilot
      github.copilot-chat
    ];
  };
}
