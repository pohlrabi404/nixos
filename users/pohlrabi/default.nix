{ config, pkgs, ... }:

{
	home.username = "pohlrabi";
	home.homeDirectory = "/home/pohlrabi";
	home.stateVersion = "24.11";

	programs.home-manager.enable = true;

	imports = [
		./yazi
		./sway
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

	programs.neovim = {
		enable = true;
		defaultEditor = true;
		viAlias = true;
	};

	programs.zsh = {
		enable = true;
	};

	programs.bash = {
		enable = true;
	};

};
}
