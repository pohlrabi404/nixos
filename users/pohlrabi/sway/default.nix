{
  pkgs,
  # homeDir,
  # mkSymlink,
  lib,
  config,
  ...
}:
let
  swayConfig = pkgs.substituteAll {
    src = ./.config/config;
    background = "${config.home.homeDirectory}/.dotfiles/backgrounds/rain.gif";
  };
in
{
  home.packages = with pkgs; [
    autotiling
    grim
    slurp
    wl-clipboard

    # monitor
    btop
    fastfetch

    # background daemon
    swww
  ];

  wayland.windowManager.sway = {
    enable = true;

    # temp fix
    checkConfig = false;
    package = pkgs.swayfx;

    # gtk
    wrapperFeatures.gtk = true;

  };

  xdg.configFile."sway/config" = lib.mkForce {
    source = swayConfig;
  };
}
