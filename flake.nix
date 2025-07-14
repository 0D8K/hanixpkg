{
  description = "Configuración compartida";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs, unstable, ... } @ inputs: 
  let
    system = "x86_64-linux";

    # Función para crear instancias de pkgs con configuración común
    mkPkgs = pkgsInput: import pkgsInput {
      inherit system;
      config.allowUnfree = true;
    };

    pkgs = mkPkgs nixpkgs;
    unstablePkgs = mkPkgs unstable;

    commonModules = [
      ./shared/configuration.nix
      ./shared/hacking.nix
      ./shared/essentials.nix
    ];

    # Función para crear configuraciones NixOS con argumentos comunes
    mkNixosSystem = hostName: extraModules: nixpkgs.lib.nixosSystem {
      inherit system;
      modules = commonModules ++ extraModules;
      specialArgs = { 
        inherit pkgs unstablePkgs;
        inherit inputs;
      };
    };
  in {
    nixosConfigurations = {
      laptop = mkNixosSystem "laptop" [
        ./hosts/laptop.nix
        ./shared/appearance.nix
      ];

      vm = mkNixosSystem "vm" [
        ./hosts/vm.nix
        ./shared/vmware.nix
        ./shared/appearanceX.nix
      ];

      pc = mkNixosSystem "pc" [
        ./hosts/pc.nix
      ];
    };
  };
}
