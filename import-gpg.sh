mkdir -p ~/.gnupg && chmod 700 ~/.gnupg
gpg --import myprivatekeys.asc
gpg --import mypubkeys.asc
gpg -K
gpg -k
gpg --import-ownertrust otrust.txt

KEY_ID=$(gpg --list-secret-keys | head -4 | tail -1 | sed "s/ //g")

echo "Key Id: $KEY_ID"

gpg --keyserver hkp://pool.sks-keyservers.net --send-keys "$KEY_ID"
