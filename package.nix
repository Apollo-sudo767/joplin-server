{ pkgs ? import <nixpkgs> {} }:

pkgs.writeShellApplication {
  name = "joplin-server";
  runtimeInputs = with pkgs; [ coreutils podman ];
  text = ''
    echo "=========================================================="
    echo "  Joplin Server Flake (NixOS Module & Package Runner)"
    echo "=========================================================="
    echo ""
    echo "To run Joplin Server on NixOS, enable the module in your configuration:"
    echo ""
    echo "  inputs.joplin-server.url = \"github:your-user/joplin-server-flake\";"
    echo ""
    echo "  services.joplin-server = {"
    echo "    enable = true;"
    echo "    baseUrl = \"https://joplin.example.com\";"
    echo "    database.createLocally = true;"
    echo "    nginx.enable = true;"
    echo "  };"
    echo ""
    echo "For standalone CLI container run:"
    echo "  exec podman run --rm -it -p 22300:22300 joplin/server:v3.2.1-beta \"$*\""

    if [ "$#" -gt 0 ]; then
      exec podman run --rm -it -p 22300:22300 joplin/server:v3.2.1-beta "$@"
    fi
  '';
}
