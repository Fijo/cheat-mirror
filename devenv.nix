{ pkgs, lib, config, inputs, ... }:

{
  packages = with pkgs; [
    git
  ];

  languages.python = {
    enable = true;
    package = pkgs.python3.withPackages (ps: [
      ps.mkdocs
      ps.mkdocs-material
    ]);
    # venv.enable = true;
  };
  languages.nix = {
    enable = true;
    lsp.enable = true;
  };

  # https://devenv.sh/processes/
  processes.serve = {
    ports.http.allocate = 8080;
    exec = ''
      mkdocs serve -a localhost:${toString config.processes.serve.ports.http.value}
    '';
  };

  tasks = {
    "app:build" = {
      exec = ''
        mkdocs build
      '';
      execIfModified = [
        "*.md"
        "mkdocs.yml"
      ];
    };
    #"devenv:enterShell".after = [ "app:start" ];
  };
  
  devcontainer = {
    enable = true;
    settings.customizations.vscode.extensions = [
      "redhat.vscode-yaml"
      "DavidAnson.vscode-markdownlint"
      "streetsidesoftware.code-spell-checker"
      "jnoortheen.nix-ide"
    ];
  };
}
