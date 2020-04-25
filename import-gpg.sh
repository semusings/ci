mkdir -p ~/.gnupg && chmod 700 ~/.gnupg
gpg --import myprivatekeys.asc
gpg --import mypubkeys.asc
gpg --import-ownertrust otrust.txt
gpg -K

KEY_ID=$(gpg -K | head -4 | tail -1 | sed "s/ //g")

echo "Key Id: $KEY_ID"
gpg --send-keys --keyserver keyserver.ubuntu.com "$KEY_ID"
gpg --keyserver hkp://pool.sks-keyservers.net --send-keys "$KEY_ID"
