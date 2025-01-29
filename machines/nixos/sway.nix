{ pkgs, ... }:

{
  # sway related
  security.polkit.enable = true;
  hardware.graphics = {
    enable = true;
  };

  services.greetd.settings = {
    enable = true;
    default_session = {
      command = ''
        ${pkgs.greetd.greetd}/bin/agreety --cmd sway \
        --power-shutdown "sudo systemctl poweroff" \
        --theme border=magneta;text=magneta;prompt=green;time=magneta;\
        action=magneta;container=white;button=magneta;input=red
      '';
      user = "pohlrabi";
    };
  };
}
