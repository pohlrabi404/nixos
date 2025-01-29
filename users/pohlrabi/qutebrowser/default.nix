{
  pkgs,
  homeDir,
  mkSymlink,
  ...
}:
{
  home.packages = with pkgs; [
    qutebrowser
  ];
  xdg.configFile."qutebrowser" = {
    recursive = true;
    source = mkSymlink "${homeDir}/qutebrowser/.config";
  };
}
