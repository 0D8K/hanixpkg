{
  description = "Configuración compartida";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

  outputs = { self, nixpkgs }: {
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./shared/configuration.nix
          ./hosts/laptop.nix
          ./shared/hacking.nix
          ./shared/appearance.nix
        ];
      };

      wm = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./shared/configuration.nix
          ./hosts/laptop.nix
          ./shared/hacking.nix
          ./shared/appearanceX.nix
        ];
      };

      pc = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/pc.nix
          ./shared/configuration.nix
          ./shared/hacking.nix
          ./shared/appearance.nix
        ];
      };
    };
  };
}

