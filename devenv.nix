{ pkgs, ... }:

{
  languages.elixir.enable = true;
  services.postgres = {
    enable = true;
    package = pkgs.postgresql_15;
    initialDatabases = [{ name = "mydb"; }];
    extensions = extensions: [
      extensions.postgis
      extensions.timescaledb
    ];
    settings.shared_preload_libraries = "timescaledb";
    initialScript = "CREATE EXTENSION IF NOT EXISTS timescaledb;";
    listen_addresses = "0.0.0.0";
    port = 5432;
  };
}
