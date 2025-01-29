{ homeDir, mkSymlink, ... }:

{
  programs.nushell = {
    enable = true;
  };

  xdg.configFile."nushell" = {
    recursive = true;
    source = mkSymlink "${homeDir}/nushell/.config";
  };
}
