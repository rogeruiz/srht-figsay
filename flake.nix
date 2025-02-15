{
  description = "A flake for Figsay";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs =
    { self, nixpkgs }:
    let
      lastModifiedDate = self.lastModifiedDate or self.lastModified or "19700101";
      version = builtins.substring 0 8 lastModifiedDate;
      supportedSystems = [
        "x86_64-linux"
        "x86_64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
      nixpkgsFor = forAllSystems (
        system:
        import nixpkgs {
          inherit system;
          overlays = [ self.overlay ];
        }
      );
    in
    {
      overlay = final: prev: {
        figsay-fonts = with final; stdenv.mkDerivation {
          name = "figsay-fonts-${version}";
          src = ./.;
          unpackPhase = "true";
          buildPhase = ":";
          installPhase = ''
            mkdir -p $out/share
            cp -r $src/fonts $out/share/fonts
          '';
        };
        figsay-script = with final; writeShellApplication {
          name = "figsay";

          runtimeInputs = [
            figlet
            ripgrep
            fd
          ];

          text = builtins.readFile ./figsay.sh;
        };

        figsay-all = with final; symlinkJoin
          {
            name = "figsay-all";
            paths = [ figsay-script figsay-fonts ];
          };
      };
      packages = forAllSystems (system: rec {
        inherit (nixpkgsFor.${system}) figsay-all;
        default = figsay-all;
      });
    };
}
