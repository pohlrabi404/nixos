{ homeDir, mkSymlink, lib, ... }:

{
    programs.kitty = {
        enable = true;
    };

    xdg.configFile."kitty/kitty.conf" = lib.mkForce {
        source = mkSymlink "${homeDir}/kitty/.config/kitty.conf";
    };
}
