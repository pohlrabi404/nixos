{ config, pkgs, ... }:

{
	home.username = "pohlrabi";
	home.homeDirectory = "/home/pohlrabi";
	home.stateVersion = "24.11";
	home.sessionVariables = {
		EDITOR = "nvim";
		VISUAL = "nvim";
	};
	programs.home-manager.enable = true;

	# user packages
	home.packages = with pkgs; [
		fzf
		lazygit
		yazi
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

	programs.neovim = {
		enable = true;
		defaultEditor = true;
		viAlias = true;
	};
}
