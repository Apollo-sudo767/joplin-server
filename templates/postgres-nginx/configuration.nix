# PostgreSQL + Nginx + SSL Joplin Server Setup Example
{ config, pkgs, ... }:

{
  services.joplin-server = {
    enable = true;
    baseUrl = "https://joplin.mydomain.com";
    logLevel = "info";

    # Database Toggles & Config
    database = {
      type = "postgres";
      createLocally = true; # Toggles automatic local PostgreSQL database & user provisioning
      name = "joplin_db";
      user = "joplin_user";
      passwordFile = "/var/lib/joplin-server/db-password";
    };

    # Storage Toggle
    storage = {
      driver = "Filesystem";
      path = "/var/lib/joplin-server/storage";
    };

    # Nginx Reverse Proxy & Let's Encrypt SSL Toggles
    nginx = {
      enable = true; # Toggles Nginx reverse proxy generation
      forceSSL = true;
      enableACME = true;
    };

    # Security Sandboxing Toggle
    systemdHardening = {
      enable = true;
    };
  };

  # Let's Encrypt Certificate Admin Email
  security.acme.defaults.email = "admin@mydomain.com";
  security.acme.acceptTerms = true;
}
