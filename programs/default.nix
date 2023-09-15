{ config, pkgs, ... }: {

    imports = [
        ./hyprland.nix
        ./git.nix
        ./kitty.nix
        ./spotify.nix
        ./theme.nix
        ./utils.nix
        ./waybar.nix
    ];
}

