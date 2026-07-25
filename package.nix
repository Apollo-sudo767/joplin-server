{ pkgs ? import <nixpkgs> {} }:

pkgs.writeShellApplication {
  name = "joplin-server";
  runtimeInputs = with pkgs; [ coreutils podman ];
  text = ''
    cat << 'EOF'
     ___                    ___ _ 
    |_  |                  / _ (_)
      | | ___  _ __  | (_| | |_ _ __    ___  ___ _ __  _____ _ __ 
      | |/ _ \| '_ \ |  _  | | | '_ \  / __|/ _ \ '__|/ _ \ '__|
  /\__/ / (_) | |_) |  | | | | | | | | \__ \  __/ |  |  __/ |   
  \____/ \___/| .__/   \_| |_/_|_|_| |_|___/\___|_|   \___|_|   
              | |                                               
              |_|                                               
    Joplin Server Flake (NixOS Module & Package Runner)

    To run Joplin Server on NixOS, enable the module in your configuration:

      inputs.joplin-server.url = "github:your-user/joplin-server-flake";

      # In your NixOS configuration:
      imports = [ inputs.joplin-server.nixosModules.default ];

      services.joplin-server = {
        enable = true;
        baseUrl = "https://joplin.example.com";
        database.createLocally = true;
        nginx.enable = true;
      };

    For standalone CLI container run:
      exec podman run --rm -it -p 22300:22300 joplin/server:v3.2.1-beta "$@"
    EOF

    if [ "$#" -gt 0 ]; then
      exec podman run --rm -it -p 22300:22300 joplin/server:v3.2.1-beta "$@"
    fi
  '';
}
