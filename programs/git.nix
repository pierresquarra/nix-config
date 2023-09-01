{ config, pkgs, ... }: 
let
  personal = import ../personal.nix;
in
{

  programs.git = {
    enable = true;
    userName = "${personal.gitusername}";
    userEmail = "${personal.gitemail}";
  };

}