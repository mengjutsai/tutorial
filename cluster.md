# Introduction

## Lxplus

### Login with ssh key (then no password required)

Generate key (if you have it you can skip)

```
ssh-keygen -t rsa
```

Copy to you lxplus (or cluster), it will create a file `~/.ssh/authorized_keys`

```
ssh-copy-id <username>@<remote machine name>
# example: ssh-copy-id metsai@lxplus.cern.ch
```


On the local machine, create a file `~/.ssh/config` and include the following information

```
Host svn.cern.ch svn
GSSAPIAuthentication yes
GSSAPIDelegateCredentials yes
Protocol 2
ForwardX11 no

Host gitlab.cern.ch
GSSAPIAuthentication yes
GSSAPIDelegateCredentials yes
Protocol 2
ForwardX11 no

Host lxplus*.cern.ch lxplus lxplus*
Protocol 2
GSSAPIAuthentication yes
GSSAPIDelegateCredentials yes
PubkeyAuthentication no
ForwardX11 yes

Host *
  Protocol 2
  AddKeysToAgent yes
  IdentityFile ~/.ssh/id_rsa
  ServerAliveInterval 120
```

The final step is to change the authority on the local machine

```
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/config ~/.ssh/id_rsa.pub
```

Before login, `kinit` to make the local machine remember the password. Once the above configuration is set, if you reboot your local machine, the only step to login to lxplus without password is `kinit`.
```
kinit <yourname>@CERN.CH
# example: kinit metsai@CERN.CH
```
