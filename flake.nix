{
  description = "Home Manager configuration";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { nixpkgs, home-manager, hyprland, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      config = { allowUnfree = true; };

      personal = import ./personal.nix;
    in 
    {
      homeConfigurations."${personal.username}" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example, the path to your home.nix.
        modules = [
          ./home.nix
          
          hyprland.homeManagerModules.default
          {wayland.windowManager.hyprland.enable = true;}
        ];

        # Optionally use extraSpecialArgs to pass through arguments to home.nix
      };
    };
}
