{ config, pkgs, ... }:

{
	services.keyd = {
		enable = true;
		keyboards = {
			default = {
				ids = [ "*" ];
				extraConfig = ''
				[main]
				muhenkan = layer(meta)
				capslock = overload(control, esc)
				esc = capslock
				d = lettermod(numpad, d, 200, 100)
				s = lettermod(special, s, 200, 100)
				f = lettermod(bracket, f, 200, 100)

				[numpad]
				n = 0
				m = 1
				, = 2
				. = 3
				j = 4
				k = 5
				l = 6
				u = 7
				i = 8
				o = 9
				p = +
				[ = -
				; = *
				' = /

				[special]
				m = !
				, = @
				. = `
				j = $
				k = %
				l = ^
				u = &
				i = *

				[bracket]
				j = [
				k = ]
				d = layer(ubracket)
				s = layer(ebracket)

				[ubracket]
				j = {
				k = ]

				[ebracket]
				j = (
				k = )

				'';
			};
		};
	};
}
