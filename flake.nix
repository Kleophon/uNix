{
  description = "uNix - kleophon's sysconf";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };    
    aagl.url = "github:ezKEa/aagl-gtk-on-nix/release-26.05";
    aagl.inputs.nixpkgs.follows = "nixpkgs"; 
      fenix = {
        url = "github:nix-community/fenix";
        inputs.nixpkgs.follows = "nixpkgs";
      };
  };
  outputs = { self, nixpkgs, home-manager,aagl,fenix,  ... }@inputs: {
    nixosConfigurations."uNix" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
        specialArgs = { inherit inputs fenix; }; 
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit inputs; };
          home-manager.users.kleophon = import ./home.nix;

        }
         {
          imports = [ aagl.nixosModules.default ];
          nix.settings = aagl.nixConfig; 
          programs.anime-game-launcher.enable = true; 
          programs.anime-games-launcher.enable = true;
          programs.honkers-railway-launcher.enable = true;
          programs.honkers-launcher.enable = true;
          programs.wavey-launcher.enable = true;
          programs.sleepy-launcher.enable = true;
        }
         {
           environment.systemPackages = [
             fenix.packages.x86_64-linux.stable.toolchain
           ];
         }
      ];
    };
  };
}
