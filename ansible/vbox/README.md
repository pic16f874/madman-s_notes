### Ansible

`vboxmanage list vms | grep '"XU2404"'`
`vboxmanage showvminfo 53fe2787-62ce-4e59-ba3a-e853f352a6a4 --machinereadable | grep 'Forwarding.*=\"SSH' `

This ansible folder aims to deploy and configure new `Ubuntu in Virtual Box` .

`ans-vlt-pwd: M....1...4`

`ansible-vault create --vault-password-file ../../../ans-vlt-pwd inventory/group_vars/vbox/vault.yml`

`ansible-vault edit --vault-password-file ../../../ans-vlt-pwd inventory/group_vars/vbox/vault.yml`

`ansible-playbook play_os_prepare.yaml -i inventory --list-hosts --list-tasks --limit=acc-1,acc-2`

`ansible-playbook --vault-password-file ../../../ans-vlt-pwd play_os_prepare.yaml -i inventory --limit=acc-1`
-----
playbook rely that sshd installed and NAT port forwarding configured

`apt install ssh; systemctl enable ssh; systemctl status ssh`

| HostIP   | Host Port | GuestIP   | Guest Port |
| ---      | ---       | ---       | ---
|127.0.0.1 | 2222      | 10.0.2.15 | 22 |

-----

```
git config --local --list
core.repositoryformatversion=0
core.filemode=true
core.bare=false
core.logallrefupdates=true
core.sshcommand=ssh -i ~/.ssh/pic16f874_ed25519
remote.origin.url=git@github.com:pic16f874/madman-s_notes.git
remote.origin.fetch=+refs/heads/*:refs/remotes/origin/*
branch.master.remote=origin
branch.master.merge=refs/heads/master
user.email=pic16f874
user.name=Nick
commit.gpgsign=false
```


## xfce
Window manager - Style - Theme - UA2
~/.themes/UA2
/home/m-ivanov/.config/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml
<property name="theme" type="string" value="UA2"/>
