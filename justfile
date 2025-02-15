alias help := default
alias h := default
alias b := build
alias i := install
alias rm := uninstall

[private]
@default:
    just -l

[doc('Build the Nix derevation')]
build:
    nix build

[doc('Uninstall Figsay so it can be installed')]
uninstall:
    nix profile remove figsay

[doc('Install figsay so it can be run anywhere')]
install:
    nix profile install
