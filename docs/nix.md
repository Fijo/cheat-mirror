# NIX

## Management

`sudo vim /etc/nixos/configuration.nix`
`sudo nixos-rebuild switch`
`man configuration.nix`


`nix-channel --update`
`nix flake update`

`vim ~/.config/home-manager/home.nix`
`home-manager switch`
`man home-configuration.nix`

`nix repl`

`nix eval .#` also see [examples](https://nix.dev/manual/nix/2.18/command-ref/new-cli/nix3-eval#examples)

`nix build .#package-name` for flakes
`nix build -f my-file.nix` for non flakes

`nix-build '<nixpkgs>' --attr openssl.all`

`nix derivation show /nix/store/z3hhlxbckx4g3n9sw91nnvlkjvyw754p-myname.drv` inspecting a derivation

interesting: seams like you can even publish stuff to external source with the dist phase in nix - is it really for that? `https://nixos.org/manual/nixpkgs/stable/#ssec-distribution-phase`

### free up space
`nix-store --gc && nix-store --optimize`

## Setup

### HomeManager

Follow the [Standalone installation Guide](https://nix-community.github.io/home-manager/#sec-install-standalone).

## References

- [Package search](https://search.nixos.org/packages)
- [NIX: Visual Studio Code](https://wiki.nixos.org/wiki/Visual_Studio_Code)
- <https://nixos.wiki/wiki/Nixos-rebuild>
- [Nixpkgs Manual](https://ryantm.github.io/nixpkgs/using/configuration/#chap-packageconfig)
- [Nix Language: Tips & Tricks](https://nixos.wiki/wiki/Nix_Language:_Tips_%26_Tricks)
- [Nix Channel Status](https://status.nixos.org/)
- [Nix Language: derivations](https://nix.dev/manual/nix/2.28/language/derivations)
- [stdenv.mkDerivation](https://nixos.org/manual/nixpkgs/stable/#sec-using-stdenv)
- [stdenv.mkDerivation: which folders go where](https://github.com/NixOS/nixpkgs/blob/master/pkgs/build-support/setup-hooks/multiple-outputs.sh)
