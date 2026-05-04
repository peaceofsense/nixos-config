{
  description = "yes";

  inputs = {
    nixpkgsStable.url = "nixpkgs/nixos-25.11"; # Change this to update version
    nixpkgsUnstable.url = "nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgsStable";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgsStable";
    };
    openlca-nix = {
      url = "github:peaceofsense/openlca-nix";
      inputs.nixpkgs.follows = "nixpkgsUnstable";
    };
    dms = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgsUnstable";
    };


  };

  outputs =
  { self, nixpkgsStable, nixpkgsUnstable, nixos-hardware, home-manager, zen-browser, openlca-nix, dms, ... } @ inputs:
    let
      lib = nixpkgsStable.lib; # It is like pass nixpkgs to this var
      system = "x86_64-linux";
      #lib-un = inputs.nixpkgUnstable.lib;
      pkgs = import nixpkgsStable {
        inherit system;
        config.allowUnfree = true;
      };

      pkgsUnstable = import nixpkgsUnstable {
        inherit system;
        config.allowUnfree = true;
      };
      username = "peaceofsense";
    in {

    nixosConfigurations = {
      monolith = lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/monolith/configuration.nix
          nixos-hardware.nixosModules.lenovo-thinkpad-t480
          dms.nixosModules.dank-material-shell
          { nixpkgs.overlays = [ (final: prev: { dgop = pkgsUnstable.dgop; }) ]; } # Needed for DMS

          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.extraSpecialArgs = {
              inherit inputs;
            };
            home-manager.users.peaceofsense = import ./hosts/monolith/home.nix;

          }

          { environment.systemPackages = [
            inputs.zen-browser.packages.${system}.default
            inputs.openlca-nix.packages.${system}.default
          ]; }

        ];

        specialArgs = {
          inherit username;
          inherit pkgsUnstable;
          inherit inputs;
        };
      };

    };
    /*
    homeConfigurations = {
      peaceofsense = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          stylix.homeManagerModules.stylix
          ./home.nix
          catppuccin.homeModules.catppuccin
        ];
      };
    };
    */
  };

}
