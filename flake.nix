{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors.url = "github:misterio77/nix-colors";

    prism = {
      url = "github:IogaMaster/prism";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = {...} @ inputs: let
    # super simple boilerplate-reducing
    # lib with a bunch of functions
    myLib = import ./myLib/default.nix {inherit inputs;};
  in
    with myLib; {
      nixosConfigurations = {
        # ===================== NixOS Configurations ===================== #

        desktop = mkSystem ./hosts/desktop/configuration.nix;
        # thinkpad-hd = mkSystem ./hosts/thinkpad-hd/configuration.nix;
        # work = mkSystem ./hosts/work/configuration.nix;
      };

      homeConfigurations = {
        # ================ Maintained home configurations ================ #

        "brunek@desktop" = mkHome "x86_64-linux" ./hosts/desktop/home.nix;
        #"brunek@thinkpad-hd" = mkHome "x86_64-linux" ./hosts/thinkpad-hd/home.nix;

        # ========================= Discontinued ========================= #
        # "brunek@work" = mkHome "x86_64-linux" ./hosts/work/home.nix;

      };

      homeManagerModules.default = ./homeManagerModules;
      nixosModules.default = ./nixosModules;
    };
}
