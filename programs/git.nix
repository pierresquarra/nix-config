{ config, pkgs, ... }: 
let
  personal = import ../personal.nix;
in
{

  programs.git = {
    enable = true;
    userName = "${personal.git.username}";
    userEmail = "${personal.git.email}";
  };

}