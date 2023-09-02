{ config, pkgs, ... }:
let
  personal = import ../personal.nix;
  colors = import ../colors.nix;
in
{

    services.spotifyd = {
        enable = true;
        settings = {
            global = {
                username = "${personal.spotify.username}";
                password = "${personal.spotify.password}";
            };
        };
    };

}