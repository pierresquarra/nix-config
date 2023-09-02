{config, pkgs, ...}: {

  programs.kitty = {
    enable = true;

    font = {
      package = pkgs.nerdfonts;
      name = "JetBrainsMono";
    };

    theme = "Gruvbox Dark Hard";
  };

}