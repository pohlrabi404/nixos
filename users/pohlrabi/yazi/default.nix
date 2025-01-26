{ configs, pkgs, ... }:
{
	home.packages = with pkgs; [
		yazi
	];
	xdg.configFile."yazi/yazi.toml".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/users/pohlrabi/yazi/yazi.toml";
}
