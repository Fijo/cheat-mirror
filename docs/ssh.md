# SSH

## remove known host by name
(updates ~/.ssh/known_hosts)
`ssh-keygen -R "<MyHost>"`

## genreate key (system setup)
`ssh-keygen -t ed25519 -C "post@fijo.dev"`

## git clone without having ssh agent setup
```bash
ssh-agent bash -c 'ssh-add /home/fijo/.ssh/id_ed25519; cd /home/fijo/repos; git clone git@bitbucket.org:Fijo/fijo.personal.toolkit.git'
GIT_SSH_COMMAND='ssh -i /home/fijo/.ssh/id_ed25519 -o IdentitiesOnly=yes' git clone git@bitbucket.org:Fijo/fijo.personal.toolkit.git
# only ipv4 as and all the debugging too
git -c core.sshCommand="ssh -vvv -i /home/fijo/.ssh/id_ed25519 -o IdentitiesOnly=yes" clone git@bitbucket.org:Fijo/fijo.personal.toolkit.git --progress --verbose --ipv4
```

## SCP & sudo

From server to local machine:
```bash
ssh user@server "sudo cat /etc/dir/file" > /home/user/file
```

From local machine to server:
```bash
cat /home/user/file | ssh user@server "sudo tee -a /etc/dir/file"
```

[Source](https://askubuntu.com/a/872537)

## Validating SSH Fingerprint

On the remote server you can find out its fingerprint(s) as follows:

SSH host keys are stored in `/etc/ssh/`, which you generally do not need to choose. These keys were generated when the openssh-server package was installed.

You can list the fingerprint of the keys by `ssh-keygen -l -f /etc/ssh/ssh_host_key.pub` though you will need to repeat this for each public key.
