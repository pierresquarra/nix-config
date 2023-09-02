{ config, pkgs, ... }: {

    imports = [
        ./hyprland.nix
        ./git.nix
        ./kitty.nix
        ./python.nix
        ./spotify.nix
        ./theme.nix
        ./utils.nix
        ./waybar.nix
    ];
}

