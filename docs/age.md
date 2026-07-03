# Age

I prefer using age backed by a password protected post-quantum key.  
Also don't password protect age keyfiles.  
Age was intendet to be used with automation, where you must be able to decrypt passwords anyway.  
If you still want to use passwords, read some of my [notes](../blog/sops-backed-by-password-protected-age-rabbit-hole.md), on going down that rabbit hole.

## Setup 

```bash
mkdir -p ~/.config/sops/age
age-keygen -pq -o ~/.config/sops/age/keys.txt
```

Add your public key to the `.sops.yaml` in the root of git repos you want to use secrets in.  
See [age sops docs](https://getsops.io/docs/usage/identities/age/) for details.

## References

See [age on github](https://github.com/FiloSottile/age).
