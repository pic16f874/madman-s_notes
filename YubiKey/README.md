#### Common steps:


[Prepare gpg keys](https://github.com/pic16f874/madman-s_notes/blob/master/GPG/README.md)
```
1. create master gpg key
2. create sign,encrypt,auth subkeys
3. create revocation cert
4. backup keys
```
-
```
5. transfer subkeys to Yubikey
6. safely cleanup gpg
7. test
8. ( restore from backups import to gpg)
9. ( reissue  [expired] keys, decrypt files with reissued keys  )

```
-
Useful links:

**[Yubikey Protocols and Applications](https://docs.yubico.com/hardware/yubikey/yk-tech-manual/yk5-apps.html#protocols-and-applications)**

**[DrDuh manual](https://github.com/drduh/YubiKey-Guide)**

#### Install Yubikey PPA repo:
```bash
sudo add-apt-repository ppa:yubico/stable && sudo apt-get update
sudo apt install yubikey-manager yubikey-personalization-gui libpam-yubico libpam-u2f yubikey-manager-qt yubioath-desktop
```
or ?
```bash
sudo apt-get -y install wget gnupg2 gnupg-agent dirmngr cryptsetup scdaemon pcscd secure-delete hopenpgp-tools yubikey-personalization libssl-dev swig libpcsclite-dev python3-pip python3-pyscard
```


possible storages:
 - AWS-S3
 - GH
 - GG-Drive
