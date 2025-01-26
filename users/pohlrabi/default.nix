{ config, pkgs, ... }:

{
	home.username = "pohlrabi";
	home.homeDirectory = "/home/pohlrabi";
	home.stateVersion = "24.11";
	programs.home-manager.enable = true;

	# user packages
	home.packages = with pkgs; [
		neovim
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
