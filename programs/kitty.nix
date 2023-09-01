{config, pkgs, ...}: {

  programs.kitty = {
    enable = true;

    font = {
      package = pkgs.jetbrains-mono;
      name = "jetbrains-mono";
    };

    theme = "Gruvbox Material Dark Hard";
  };

}