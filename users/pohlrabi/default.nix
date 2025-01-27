{ config, pkgs, ... }:
let
	mkSymlink = path: config.lib.file.mkOutOfStoreSymlink path;
	homeDir = "${config.home.homeDirectory}/.dotfiles/users/pohlrabi";
in
{
	home.username = "pohlrabi";
	home.homeDirectory = "/home/pohlrabi";
	home.stateVersion = "24.11";

	home.sessionVariables = {
		XDG_CACHE_HOME = "$HOME/.cache";
	};

	programs.home-manager.enable = true;

	_module.args = { 
		inherit mkSymlink;
		inherit homeDir;
	};

	imports = [
		./yazi
		./sway
		./nushell
		./nvim
	];

	# user packages
	home.packages = with pkgs; [
		fzf
		lazygit
	];

	# general program settings
	programs.git = {
		enable = true;
		userName = "Pohl";
		userEmail = "pohlrabi404@gmail.com";
	};

	programs.lazygit = {
		enable = true;
	};

}
