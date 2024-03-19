{
    description = "Flake for personal tmux config";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
		flake-utils.url = "github:numtide/flake-utils";
	};

	outputs = { self, nixpkgs, flake-utils, ... }: {
        overlays.default = import ./overlay.nix;
    } // flake-utils.lib.eachSystem flake-utils.lib.allSystems (system:
	let 

	pkgs = import nixpkgs {
		inherit system;
		overlays = [
			self.overlays.default
		];
	};

	in {
        packages.default = pkgs.tmuxc;

		devShell = pkgs.mkShell {
			packages = (with pkgs; [
				tmuxc
			]);
		};
	});
}
