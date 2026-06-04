# NIX

## Management

`sudo vim /etc/nixos/configuration.nix`
`sudo nixos-rebuild switch`
`man configuration.nix`


`nix-channel --update`

`vim ~/.config/home-manager/home.nix`
`home-manager switch`
`man home-configuration.nix`

`nix repl`
`nix eval .#`
`nix build .#package-name`


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
