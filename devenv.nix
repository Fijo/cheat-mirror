{ pkgs, lib, config, inputs, ... }:

let pyPackage = pkgs.python3.withPackages (ps: [ps.mkdocs ps.mkdocs-material]);

in {
  # cachix.enable = false;

  packages = with pkgs; [
    git
  ];

  languages.python = {
    enable = true;
    package = pyPackage;
    # venv.enable = true;
  };
  languages.nix = {
    enable = true;
    lsp.enable = true;
  };

  processes.serve = {
    ports.http.allocate = 8080;
    exec = ''
      mkdocs serve -a localhost:${toString config.processes.serve.ports.http.value}
    '';
  };

  # tasks = {
  #   "app:build" = {
  #     exec = ''
  #       mkdocs build
  #     '';
  #     execIfModified = [
  #       "*.md"
  #       "mkdocs.yml"
  #     ];
  #   };
  # };
  
  devcontainer = {
    enable = true;
    settings.customizations.vscode.extensions = [
      "redhat.vscode-yaml"
      "DavidAnson.vscode-markdownlint"
      "streetsidesoftware.code-spell-checker"
      "jnoortheen.nix-ide"
    ];
  };

  outputs = {
    fijo-cheat = pkgs.stdenv.mkDerivation {
      pname = "fijo-cheat"; # -devdoc
      version = "0.3";

      outputs = [ "out" ];

      src = builtins.path {
        path = ./.;
        name = "source";
      };

      nativeBuildInputs = [ pyPackage ];

      buildPhase = ''
        runHook preBuild

        mkdir -p $out/share/fijo-cheat/html
        mkdocs build --site-dir $out/share/fijo-cheat/html
        
        runHook postBuild
      '';
    };
  };

}
