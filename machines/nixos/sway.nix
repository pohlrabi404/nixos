{ ... }:

{
  # sway related
  security.polkit.enable = true;
  hardware.graphics = {
    enable = true;
  };

  # display manager
  services.displayManager.ly = {
    enable = true;
  };
}
