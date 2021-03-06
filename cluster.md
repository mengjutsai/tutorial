# Introduction

## Lxplus

### Login with ssh key

- Generate key with the steps (if you have `id_rsa` key in your local machine, you can skip this step)

```
ssh-keygen -t rsa
```

- Copy the public key (text in the public key) to your lxplus (or cluster). This command will create a file `~/.ssh/authorized_keys` and copy the texts from public key in your local machine into `~/.ssh/authorized_keys` on the cluster.

```
ssh-copy-id <username>@<remote machine name>
# example: ssh-copy-id metsai@lxplus.cern.ch
```


- On the local machine, create a file `~/.ssh/config` and include the following information

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

- The final step is to change the authority on the local machine

```
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/config ~/.ssh/id_rsa.pub
```

- Before login, `kinit` to make the local machine remember the password. Once the above configuration is set, the only step to login to lxplus without password is `kinit`. If you reboot your local machine or the password is required again when `ssh`, just `kinit` again before `ssh`.

```
kinit <yourname>@CERN.CH
# example: kinit metsai@CERN.CH
```


## Download
We can use `scp` or `rsync` to download file or upload file.

For example, download file from the cluster to the local machine (ex. your macbook).

```
rsync -avzh --progress <yourname>@<IP or cluster address>:/path/on/cluster /path/you/want/to/store/
```
- -v：verbose
- -r：recursive, to synchronize all the files in this directories.
- -a：Remain all the information
- -z：compression
- -h：human reable
- --progress: this can show the

Then, the example will look like this
```
rsync -avzh --progress metsai@umt3int01.physics.lsa.umich.edu:/lustre/umt3/user/metsai/mva/mH1000_even/Optimal_v1.root .
```
