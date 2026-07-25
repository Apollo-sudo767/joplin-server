# Caddy + Mailer Enabled Joplin Server Setup Example
{ config, pkgs, ... }:

{
  services.joplin-server = {
    enable = true;
    baseUrl = "https://notes.company.com";

    # Reverse Proxy Toggle: Caddy
    caddy = {
      enable = true; # Automatically provisions Caddy host with automatic HTTPS
    };

    # SMTP Mailer Toggles & Options (for invites & password resets)
    mailer = {
      enable = true; # Toggle email feature flag
      host = "smtp.mailgun.org";
      port = 587;
      security = "starttls";
      authUser = "postmaster@company.com";
      authPasswordFile = "/var/lib/joplin-server/smtp-password";
      fromName = "Company Joplin Sync";
      fromEmail = "no-reply@company.com";
    };

    # Custom secrets file for environment variables
    environmentFile = "/var/lib/joplin-server/secrets.env";
  };
}
