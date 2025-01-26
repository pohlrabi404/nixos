{ config, pkgs, mkSymlink, homeDir, ... }:
{
	home.packages = with pkgs; [
		yazi
	];
	xdg.configFile."yazi/yazi.toml".source = mkSymlink "${homeDir}/yazi/yazi.toml";
}
