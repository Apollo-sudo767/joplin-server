{
  description = "Basic Joplin Server NixOS Setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    joplin-server.url = "github:user/joplin-server-flake"; # Replace with repo path
  };

  outputs = { self, nixpkgs, joplin-server }: {
    nixosConfigurations.my-server = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        joplin-server.nixosModules.default
        ./configuration.nix
      ];
    };
  };
}
