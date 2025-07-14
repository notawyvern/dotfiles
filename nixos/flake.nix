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
	pkgs-unstable = import nixpkgs-unstable 
		{inherit system; config.allowUnfree = true;};
    in {

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
	./hardware-configuration.nix

	./system/extra/networking.nix
	./system/extra/audio.nix
	./system/extra/locale.nix
	./system/extra/swap.nix
        
	./system/core/boot.nix
	./system/core/users.nix
	./system/core/pkgmgr.nix
        
        ./desktop/loginmgr.nix
        ./desktop/firefox.nix

	home-manager.nixosModules.home-manager {

	home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit pkgs-unstable; };
        
        /* modules sourced within the home.nix dotfile
        include the wayland compositor and general
        configurations declared */
        home-manager.users.crh = import ./desktop/home-manager/home.nix;

        }
        ];
        };
	};

}
