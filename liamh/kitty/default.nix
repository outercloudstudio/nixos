{ config, pkgs, ... }:

{
	programs.kitty = {
		enable = true;

		font = {
			name = "Fira Code";
		};

		themeFile = "gruvbox-dark";

		settings = {
			confirm_os_window_close = 0;
		};
  };
}