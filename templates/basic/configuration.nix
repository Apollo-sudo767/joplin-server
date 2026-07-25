# Minimal Joplin Server NixOS Configuration Example
{ config, pkgs, ... }:

{
  services.joplin-server = {
    enable = true;
    baseUrl = "https://joplin.example.com";

    # Toggles:
    # useContainer = true; # (default) runs in OCI Podman container
    # openFirewall = true; # opens service port in firewall
    # database.createLocally = true; # auto creates local postgres DB
  };
}
