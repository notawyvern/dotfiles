{
  description = "NixOS configuration";

  inputs = {
	nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
	nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

	home-manager.url = "github:nix-community/home-manager/release-25.05";
	home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager }:

    let
	system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
	pkgs-unstable = import nixpkgs-unstable 
		{inherit system; config.allowUnfree = true;};
    in {

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = 
          { inherit pkgs-unstable; };

        modules = [
	./hardware-configuration.nix

	./.system/networking.nix
	./.system/audio.nix
	./.system/swap.nix
	./.system/nixpkgs.nix
        
	./.core/boot.nix
	./.core/users.nix
	./.core/locale.nix
	
	./.home/browsers/firefox.nix

	home-manager.nixosModules.home-manager {

	home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        
        /* modules sourced within the home.nix dotfile
        include the wayland compositor and general
        configurations declared */
        home-manager.users.crh = import ./.home/home.nix;
        
        }
        ];
        };
	};

}
