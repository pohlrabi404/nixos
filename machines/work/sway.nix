{ pkgs, lib, ... }:

{
  # sway related
  security.polkit.enable = true;
  hardware.graphics = {
    enable = true;
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = lib.strings.concatStrings [
          "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd sway"
          " --remember --remember-user-session"
          " --time"
          " --asterisks *"
          " --theme prompt=green;border=magenta;text=magenta"
        ];
        user = "greeter";
      };
    };
  };

  programs.light.enable = true;
}
