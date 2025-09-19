{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-old.url = "github:nixos/nixpkgs/8d63c85a73c73501cc632bf2f59e5d91203fe876";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  
  outputs = { self, nixpkgs, nixpkgs-old, nixpkgs-unstable, home-manager }:
  
  let
    system = "x86_64-linux";
    bootloader = import nixpkgs-old {inherit system;};
    pkgs-unstable = import nixpkgs-unstable 
      {inherit system; config.allowUnfree = true;};
  in {
    
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit bootloader; };
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

        home-manager.nixosModules.home-manager {

          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit pkgs-unstable; };
        
          home-manager.users.crh.imports = [
            ./desktop/home-manager/home.nix # create dotfiles + enable HM
            ./desktop/home-manager/qutebrowser.nix
        
            ./desktop/home-manager/river/look.nix
            ./desktop/home-manager/river/river-core.nix
            ./desktop/home-manager/river/river.nix

            /* raw doesn't declare configurations 
            of apps, unlike the other two */
            ./desktop/home-manager/hmpkgs/raw.nix
            ./desktop/home-manager/hmpkgs/cli.nix
            ./desktop/home-manager/hmpkgs/gui.nix

          ];
        }
      ];
    };
  };

}
