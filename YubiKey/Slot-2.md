## Configuring the YubiKey(s)

We use the YubiKey Manager to configure the YubiKey(s).
## Configure your primary YubiKey

In the following, we assume that the second configuration slot of your YubiKey is unconfigured and free.

    1. Plug in the primary YubiKey.
    2. Enter ykman info in a command line to check its status.
    3. Enter ykman otp info to check both configuration slots. By default, “Slot 1” is already “programmed.”
    4. Set up slot 2 for the challenge-response mode: ykman otp chalresp -t -g 2. The parameters are “require touching the physical button to generate the response” (-t) (optional) and “generate a random secret” (-g).

You should see output similar to the following:
Using a randomly generated key: abcd…6789
Program a challenge-response credential in slot 2? [y/N]:
Press y to set up slot 2.
Done

Since we want (optionally) to store the same secret in another YubiKey or make a backup of it (recommended) do not close ykman at this point.

## Configure additional YubiKeys (optional)

For any additional YubiKey, you need to configure the same secret (the “randomly generated key”):

    1. Plug in another YubiKey.
    2. Enter ykman info to check its status.
    3. Enter ykman otp info to check both configuration slots. By default, “Slot 1” is already “programmed.”
    4. Set up slot 2 for the challenge-response mode: ykman otp chalresp -t 2 [secret]. This time, you need to enter the secret key (“abcd…6789”) instead of using the parameter “-g.”

You should see output similar to the following:

Program a challenge-response credential in slot 2? [y/N]:

Press y to set up slot 2.

Done.

Repeat this for every other YubiKey you want to use as a backup.

## Backup your secret (strongly recommended)

If you do not have a second YubiKey and/or want to program a new/backup YubiKey at a later stage you can also backup your secret key.This can be done by saving or writing down your secret key (“abcd…6789”) and storing it somewhere safe. Simply repeat the “Configure additional YubiKeys” steps with the secret key from your backup and you can use another YubiKey with the same KeePassXC database.

    Reminder: if you do not have a second Yubikey configured with the same secret and do not backup your secret key you will lose access to your database if your Yubikey breaks or get lost!


####################################################
sudo apt install yubikey-manager

$ ykman info
Device type: YubiKey 5C NFC
Serial number: 23420280
Firmware version: 5.4.3
Form factor: Keychain (USB-C)
Enabled USB interfaces: OTP, FIDO, CCID
NFC transport is enabled.

Applications	USB    	NFC    
FIDO2       	Enabled	Enabled	
OTP         	Enabled	Enabled	
FIDO U2F    	Enabled	Enabled	
OATH        	Enabled	Enabled	
YubiHSM Auth	Enabled	Enabled	
OpenPGP     	Enabled	Enabled	
PIV         	Enabled	Enabled	

~  $ ykman otp info
Slot 1: programmed
Slot 2: empty
~  $ 
