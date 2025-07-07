{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = { self, nixpkgs, nixpkgs-unstable }: 

    let
	system = "x86_64-linux";
#	pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
	pkgs-unstable = import nixpkgs-unstable 
		{inherit system; config.allowUnfree = true; };
    in {

    # replace 'joes-desktop' with your hostname here.
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
	inherit system;
	specialArgs = { inherit pkgs-unstable; };
	modules = [ ./configuration.nix ];
    };
  };
}

