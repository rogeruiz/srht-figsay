with import <nixpkgs> { };

writeShellApplication {
  name = "figsay";

  runtimeInputs = [
    figlet
    ripgrep
    fd
  ];

  text = builtins.readFile ./figsay.sh;
}
