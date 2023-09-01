{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    swaybg
  ];

  wayland.windowManager.hyprland = {
    systemdIntegration = true;
    xwayland.enable = true;
  };

  wayland.windowManager.hyprland.extraConfig = ''
    monitor = ,preferred,auto,auto

    # Fix scaling issue
    xwayland {
      force_zero_scaling = true
    }
    env = GDK_SCALE,1.5

    # Execute apps at launch
    exec-once = swaybg -i ~/pictures/wallpapers/gruvbox-dark-blue.png
    exec-once = waybar

    # Source a file (multi-file configs)
    # source = ~/.config/hypr/myColors.conf

    input {
      kb_layout = de
      kb_variant =
      kb_model =
      kb_options =
      kb_rules =

      follow_mouse = 1

      touchpad {
        natural_scroll = false
      }

      sensitivity = 0
    }

    general {
      gaps_in = 4
      gaps_out = 8
      border_size = 2
      col.active_border = rgb(83A598) rgb(282828) rgb(282828) rgb(83A598) 45deg
      col.inactive_border = rgb(282828)

      layout = dwindle
    }

    decoration {
      rounding = 4

      blur {
        enabled = true
        size = 3
        passes = 1
      }

      drop_shadow = true
      shadow_range = 4
      shadow_render_power = 3
      col.shadow = rgba(1a1a1aee)

      active_opacity = 0.95
      inactive_opacity = 0.85
    }

    animations {
      enabled = true

      bezier = myBezier, 0.05, 0.9, 0.1, 1.05

      animation = windows, 1, 7, myBezier
      animation = windowsOut, 1, 7, default, popin 80%
      animation = border, 1, 10, default
      animation = borderangle, 1, 8, default
      animation = fade, 1, 7, default
      animation = workspaces, 1, 6, default
    }

    dwindle {
      pseudotile = true
      preserve_split = true 
    }

    master {
      new_is_master = true
    }

    gestures {
      workspace_swipe = false
    }

    # Example windowrule v1
    # windowrule = float, ^(kitty)$
    # Example windowrule v2
    # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$

    $mainMod = SUPER

    bind = $mainMod, RETURN, exec, kitty
    bind = $mainMod, Q, killactive
    bind = $mainMod, F, fullscreen
    bind = $mainMod, T, togglefloating
    bind = $mainMod, E, exec, thunar
    bind = $mainMod, SPACE, exec, wofi --show drun
    bind = $mainMod, S, exec, grim -g "$(slurp)" - | convert - -shave 1x1 ~/pictures/screenshots/screenshot_$(date +\%Y-\%m-\%d_\%H-\%M).png

    # Move focus with mainMod + vim keys
    bind = $mainMod, H, movefocus, l
    bind = $mainMod, L, movefocus, r
    bind = $mainMod, K, movefocus, u
    bind = $mainMod, J, movefocus, d
    
    # Switch workspaces with mainMod + [0-9]
    bind = $mainMod, 1, workspace, 1
    bind = $mainMod, 2, workspace, 2
    bind = $mainMod, 3, workspace, 3
    bind = $mainMod, 4, workspace, 4
    bind = $mainMod, 5, workspace, 5
    bind = $mainMod, 6, workspace, 6
    bind = $mainMod, 7, workspace, 7
    bind = $mainMod, 8, workspace, 8
    bind = $mainMod, 9, workspace, 9
    bind = $mainMod, 0, workspace, 10

    # Move active window to a workspace with mainMod + SHIFT + [0-9]
    bind = $mainMod SHIFT, 1, movetoworkspace, 1
    bind = $mainMod SHIFT, 2, movetoworkspace, 2
    bind = $mainMod SHIFT, 3, movetoworkspace, 3
    bind = $mainMod SHIFT, 4, movetoworkspace, 4
    bind = $mainMod SHIFT, 5, movetoworkspace, 5
    bind = $mainMod SHIFT, 6, movetoworkspace, 6
    bind = $mainMod SHIFT, 7, movetoworkspace, 7
    bind = $mainMod SHIFT, 8, movetoworkspace, 8
    bind = $mainMod SHIFT, 9, movetoworkspace, 9
    bind = $mainMod SHIFT, 0, movetoworkspace, 10

    # Scroll through existing workspaces with mainMod + scroll
    bind = $mainMod, mouse_down, workspace, e+1
    bind = $mainMod, mouse_up, workspace, e-1

    # Move/resize windows with mainMod + LMB/RMB and dragging
    bindm = $mainMod, mouse:272, movewindow
    bindm = $mainMod, mouse:273, resizewindow

    misc {
      disable_hyprland_logo = true
      disable_splash_rendering = true
    }
  '';
}
