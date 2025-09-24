{
	description = "My NixOS Flake";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
		nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

		home-manager = {
      			url = "github:nix-community/home-manager/release-25.05";
      			inputs.nixpkgs.follows = "nixpkgs";
    		};
	};

	outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs : {
		nixosConfigurations = {
			laptop = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				modules = [
					./configurations/laptop/configuration.nix
				
					home-manager.nixosModules.home-manager {
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.liamh = import ./liamh/home.nix;
						home-manager.extraSpecialArgs = {
							pkgs-unstable = import nixpkgs-unstable {
								system = "x86_64-linux";
								config.allowUnfree = true;
							};
						};
					}
				];
				specialArgs = {
					pkgs-unstable = import nixpkgs-unstable {
						system = "x86_64-linux";
						config.allowUnfree = true;
					};
				};
			};

			tablet = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				modules = [
					./configurations/tablet/configuration.nix
				
					home-manager.nixosModules.home-manager {
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.liamh = import ./liamh/home.nix;
						home-manager.extraSpecialArgs = {
							pkgs-unstable = import nixpkgs-unstable {
								system = "x86_64-linux";
								config.allowUnfree = true;
							};
						};
					}
				];
				specialArgs = {
					pkgs-unstable = import nixpkgs-unstable {
						system = "x86_64-linux";
						config.allowUnfree = true;
					};
				};
			};
		};
	};
}
