{ config, pkgs, ... }:

{

  imports = [
    ./hypr
    ./theme
  ];

  home = {
    username = "pierre";
    homeDirectory = "/home/pierre";
    stateVersion = "23.05";

    packages = with pkgs; [
      kitty
      wofi
      dolphin
      dunst
      firefox

      # # It is sometimes useful to fine-tune packages, for example, by applying
      # # overrides. You can do that directly here, just don't forget the
      # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
      # # fonts?
      # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

      # # You can also create simple shell scripts directly inside your
      # # configuration. For example, this adds a command 'my-hello' to your
      # # environment:
      # (pkgs.writeShellScriptBin "my-hello" ''
      #   echo "Hello, ${config.home.username}!"
      # '')
    ];

    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    file = {
      # # Building this configuration will create a copy of 'dotfiles/screenrc' in
      # # the Nix store. Activating the configuration will then make '~/.screenrc' a
      # # symlink to the Nix store copy.
      # ".screenrc".source = dotfiles/screenrc;

      # # You can also set the file content immediately.
      # ".gradle/gradle.properties".text = ''
      #   org.gradle.console=verbose
      #   org.gradle.daemon.idletimeout=3600000
      # '';
    };

    # You can also manage environment variables but you will have to manually
    # source
    #
    #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  /etc/profiles/per-user/pierre/etc/profile.d/hm-session-vars.sh
    #
    # if you don't want to manage your shell through Home Manager.
    sessionVariables = {
      # EDITOR = "emacs";
    };
  };

  # Git
  programs.git = {
    enable = true;
    userName = "pierresquarra";
    userEmail = "pierre@squarra.de";
  };

  programs.kitty = {
    enable = true;

    font = {
      package = pkgs.jetbrains-mono;
      name = "jetbrains-mono";
    };

    theme = "Gruvbox Material Dark Hard";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
