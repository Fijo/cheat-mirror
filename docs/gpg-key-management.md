# GPG - Key management

## Different roles

Because you can do many things with GPG like signing / communicating and encryption of secrets,  
you will require a different different key composition and key sharing practises depending on the use case.  
They cannot all be securely handled in the same way.

### For secret management / SOPS
This is not what I do, but to understand why. Make sure to read the whole [Conclusion](#conclusion), too!
Use a unique key for each machine. Do not share them between machines.  
Just add a fingerprint for each machine to the `.sops.yaml`, to grant access.  

### For Email & Git Identity:
You should generally just use a sub-key for each machine. The primary key should be stored safely and is only required for trust/ key changes.  
Follow this [Article here](https://wiki.debian.org/Subkeys?action=show&redirect=subkeys)

### Conclusion
To make management easier for SOPS, just use age for that and not gpg.  
Its tricky to do this well with gpg and that's why age exists!

TLDR:
- Use **gpg** for **comunication and publishing things only**.
- Use **age** for **secret management related things**.

### Notes

I'm not doing any of this properly yet. I'm trying to get there and it's not an issue as I don't use my own gpg setup [For Email & Git Identity](#for-email--git-identity), yet.

## Listing keys

`gpg --list-keys`
`gpg --list-secret-keys`

## Delete key

`gpg --delete-key`
`gpg --delete-secret-key`

