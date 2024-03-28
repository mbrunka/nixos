{pkgs, ...}: {
  hardware.uinput.enable = true;
  users.groups.uinput.members = ["brunek"];
  users.groups.input.members = ["brunek"];
}
