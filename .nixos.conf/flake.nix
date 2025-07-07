{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = { self, nixpkgs, nixpkgs-unstable }: 

    let
	system = "x86_64-linux";
	pkgs-unstable = import nixpkgs-unstable 
		{inherit system; config.allowUnfree = true; };
    in {

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
	inherit system;
	specialArgs = { inherit pkgs-unstable; };
	modules = [ 
	./hardware-configuration.nix

	./.system/networking.nix
	./.system/audio.nix
	./.system/swap.nix
	./.system/nixpkgs.nix
		
	./.core/boot.nix
	./.core/users.nix
	./.core/locale.nix
	
	/*
	valid '.nix' desktops:
	sway, river, cosmic, gnome, xfce, openbox, 
	lxqt, lxqt-wayland, pantheon, cinnamon
	*/
	./.desktop/river.nix
	];
    };
  };
}

