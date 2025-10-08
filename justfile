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

[doc('Install Figsay so it can be installed in your $PATH')]
install:
    nix profile install

[doc('Run flake checks, including custom checks for outputs')]
check:
    nix flake check --all-systems

[doc('Check that all expected outputs exist and are working')]
check-outputs:
    nix build .#figsay-all
    test -d ./result/share/fonts
    test -x ./result/bin/figsay || true
