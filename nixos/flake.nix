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
        
        home-manager.users.crh.imports = [
        ./desktop/home-manager/home.nix # create dotfiles + enable HM

        ./desktop/home-manager/river.d/river-core.nix
        ./desktop/home-manager/river.d/river.nix

        /* raw doesn't declare configurations 
        of apps, unlike the other two */
        ./desktop/home-manager/apps.d/raw.nix
        ./desktop/home-manager/apps.d/cli.nix
        ./desktop/home-manager/apps.d/gui.nix

        ];
        }
        ];
        };
	};

}
