{ config, pkgs, ... }:
let
	mkSymlink = path: config.lib.file.mkOutOfStoreSymlink path;
	homeDir = "${config.home.homeDirectory}/.dotfiles/users/pohlrabi";
in
{
	home.username = "pohlrabi";
	home.homeDirectory = "/home/pohlrabi";
	home.stateVersion = "24.11";

	programs.home-manager.enable = true;

	_module.args = { 
		inherit mkSymlink;
		inherit homeDir;
	};

	imports = [
		./yazi
		./sway
		./nushell
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

	programs.nushell = {
		enable = true;
		# extraConfig = ''
		# 	def lla [...args] { ls -la ...(if $args == [] {["."]} else {$args}) | sort-by type name -i }
		# '';

		shellAliases = {
			switch = "sudo nixos-rebuild switch --verbose --show-trace";
			test = "sudo nixos-rebuild test --verbose --show-trace";
		};
	};
}
