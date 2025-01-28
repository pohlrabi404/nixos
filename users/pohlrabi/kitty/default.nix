{ homeDir, mkSymlink }:

{
    programs.kitty = {
        enable = true;
    };

    xdg.configFile."kitty" = {
        recursive = true;
        source = mkSymlink "${homeDir}/kitty/.config";
    };
}
