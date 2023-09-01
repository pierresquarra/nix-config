{ config, pkgs, ... }: {

    imports = [
        ./hyprland.nix
        ./python.nix
        ./theme.nix
        ./waybar.nix
    ];
}

