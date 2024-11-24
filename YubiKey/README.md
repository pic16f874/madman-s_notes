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

# Configure Smartcard
### Plug in a YubiKey and use GPG to configure it as a smartcard:
```gpg --card-edit```
## Enable KDF
Key Derived Function (KDF) enables YubiKey to store the hash of PIN, preventing the PIN from being passed as plain text.
```
gpg/card> admin
Admin commands are allowed

gpg/card> kdf-setup
```
## Change PIN
Default admin pin is 12345678

Yubikey has separate modules. 
GPG interface has it own `PIN` `Admin PIN` `Reset Code`
You should change it from default values.

Entering the user `PIN` incorrectly three times will cause the PIN to become blocked; it can be unblocked with either the `Admin PIN` or `Reset Code`.

Entering the `Admin PIN` or `Reset Code` incorrectly three times destroys all GPG data on the card. The Yubikey will have to be reconfigured.

Configure pin:
```
gpg/card> passwd
```
you can use up to 127 ASCII characters 


Additionally, you can change retry attempts by the command:
```
ykman openpgp access set-retries 5 5 5
```

---
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
