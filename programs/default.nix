{ config, pkgs, ... }: {

    imports = [
        ./hyprland.nix
        ./git.nix
        ./kitty.nix
        ./python.nix
        ./theme.nix
        ./utils.nix
        ./waybar.nix
    ];
}

