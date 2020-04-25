mkdir -p ~/.gnupg && chmod 700 ~/.gnupg
gpg --import myprivatekeys.asc
gpg --import mypubkeys.asc
gpg -K
gpg -k
gpg --import-ownertrust otrust.txt