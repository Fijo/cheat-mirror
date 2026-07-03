# SOPS backed by password protected age rabbit hole

This was my journey of insiting on using password protected age-keys.  
I finally realized that, others are right, you really should not do this.  
At least not if need to combine this with nixos & sops-nix.

Even if you have some kind of an agent-style setup,  
if you have services running that must decrypt secrets at runtime,  
as they should, well you can't really ever not have your secret key unlocked.

Also if an attacker can read files from disk with certain permissions alot of the time we have lost already anyway. The best way to limit this would be to restrict file read permissions and use a password.  
Once someone can read with root permissions there are keyfiles all over the systems, that would have this issue.

Anyway before I knew better I went down this rabbit hole.

## Age & sops with password

By default age would always prompt for that key and does not support an agent.  
To work around this I'm using SOPS_AGE_KEY_COMMAND.  
For now SOPS_AGE_KEY_COMMAND is set to a script, could be adjusted to use pass (backed by gpg) to decrypt the password for my age key.

While this setup is kinda stupid, I still prefer it. It lets me manage shared access using age rather than gpg.  
In the future I might change the SOPS_AGE_KEY_COMMAND to pull the password from some kind of a keychain tool.

The following script requires at least age version v1.3.0!

```bash
mkdir -p ~/.config/sops/age

age-keygen -pq | age -p > ~/.config/sops/age/keys.age
#OR
age-keygen -pq | AGE_PASSPHRASE="YOUR_PASSWORD" age -e -j batchpass > ~/.config/sops/age/keys.age

cat > ~/.pass.sh << EOF
#!/bin/bash
AGE_PASSPHRASE='YOUR_PASSWORD' age -j batchpass -d ~/.config/sops/age/keys.age
EOF
chmod +x ~/.pass.sh

mkdir ./gitsec
cd ./gitsec

git init

# you must adjust your public key ofc
cat > ./.sops.yaml << EOF
creation_rules:
    - age: >-
        age1pq15lmq8gjknr5pn0d4lwae4dssdzecfe0cgkaptjs065svez4rrc2tjepz4xnh4j7tu4t8k4qqvd3qx5g2gldfzpefd2thheygvn3sn2cs9hway3dczzl5l6m3ufn33ka24h6gsxqjdxtlgder789c29cmzx8zyxnxu66sklx0mqzr0hnhpdtrqzv825pk4v53yyv6j09cfpx7eps0g4g9gwkql37fww29knp8zv4vzdc2sxu397stefgr4h8nx3p9sskamztgydseqnpfnuw8keaavwzjfsslg3q3lhmnydrc4r4ujcpzywth3qj5s0ytt5yp020esyh9pznpht7gwnjh33ve3pvf63jg5zsyd0c288p24zfpnye88jj3kdnerm3p6x2zhur5jd7lpg3gz9zxckum7ekseevmj6gxsfd8k7a6ggtg5h96dh0v0tpvgc2vujd42p3kc2y49qlsrxe6jy2ulq5c4nj2qggnv7txpfmpyeqrwg297wce5q6zcdmqcyhu3zvv9cvm0tzmqxn8xp084jmk09tyz97dkv7pkegv4gu4zpn8h9ncmmzr8les6uwmrgh4w4p5jjgx2wzh6uuvyw3njyg08nrxxqggky3pgkz8quac8v839ssmqcc5d5vuvpz336xy02q3nz6fpfftu8qvt3tmk67h5sat0d3t5vz2ncyrf0eqz0gnpr6scz56exsdugm7u9kprj59fswey3mgqjwsk9gs54vp0fmgr2fpdparkk9c06z0cjn9epkg3d04rwkuy2yyqekg6e5frad2drz04wtfvxg8vp2agkz3lt6zpkaav2qt92e6hdyxx0kv99xec6nczsppvwuzaq2w8j3x0unkxcxfttyx3pdpmprtk9aywd3jsa30kuthvudq5f6pzzcus0hshpqc5shm9s8lp4dugspg84syptylnrmz4gye3cfz6hcqffu9rvtness5jaxfy6vlgjfxe4rpgzknzld0hd6vakjkcjgcuh6md84ywa849ynsf3vs3nctvpcjzt6hhwlepqwve698vyg3qcdj4jw6s4qykgsyf7jjyl5pd2c2q0h0gdlwtwznp4z387rs64qvspsnnts7yylrusmr0cmf7rrc3q5ptq75c6fd8kwgzfmf83dypynncr0vw98fftyhwtgv4f8zvrtfjqdyx3j9rj5kza69azgg4lgjjlqu89s9w2uzkwznj0upyx36t8jxz3t3yktla8vxagg4crc549s992k0sgrn8ugu5zts47tgcsey3w34wcrv6jy8cpzs04dzkq0my7gpfrxdp3xy8u9s2nvsgh78z4a593y0apcj3rde5q96ywxz2k5ve754mz39kqq8fr7agje78vjcty9p2mp96sfet2xn49e8j4umgx29dyzyptg3wk5v4vfvexk28guuxhyf08tmhyv7cs5e0qfxgykwrknx2ec6dzgz8935mzzshl9exk4vra3m3chzfrqy3y6esz5hlt4fqcdmg29mc3t8v573nx24s2u5878kzm74xnal5yujpx6us7auk29cd6z92kwm43zr73fu9g3u8tayw4k02s80qgjrts96d634xqafr7cqwusje9myucv6pat256dswaunsn05fjp55xe2g5jkcekx3zemdxv8y5zu9hyn7ce32ydtzwackzmh49t9d5qk2v33nxezxmrpx05xz6krl2gh2nkt2xnne03j2y9clj4zsxdr7w4phn7gzm8fvh4f9x3kfqtpcgkg82m4jmlxvaxw5780wanxxyf2fcfqydhj99u40rxs6wg3merfmdj9neydvdn5xf9a8gzfq3pudw46zfm85qstma2mlp28unky6sk772q98spy9td9czsysdsps480nwtqg39pgg500y3n89fk92tgp7awu7znrvypsglrtq76egec

EOF

sops edit ./config.json

SOPS_AGE_KEY_CMD="~/.pass.sh" sops decrypt ./config.json
```

## Concept for another approach

1. There should be a mount for /run/secret/age-keys.txt to tmpfs with appropriate permissions
2. There should be a systemd service that runs this early on in the boot process:  
   `age -d ~/.config/sops/age/keys.age -o /run/secret/age-keys.txt`  
   NOTE: This will promt the user for a password.
3. Set environment variable `SOPS_AGE_KEY_FILE=/run/secret/age-keys.txt`

## References

- See [age on github](https://github.com/FiloSottile/age).  
- <https://devops.datenkollektiv.de/using-sops-with-age-and-git-like-a-pro.html>

