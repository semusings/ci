rm -rf $HOME/.gnupg

cat >keydetails <<EOF
    %echo Generating a basic OpenPGP key
    Key-Type: RSA
    Key-Length: 4096
    Subkey-Type: RSA
    Subkey-Length: 4096
    Name-Real: Bhuwan Prasad Upadhyay
    Name-Comment: A savvy java developer | cloud native and ddd practitioner | angular developer
    Name-Email: bot.bhuwan@gmail.com
    Expire-Date: 0
    Passphrase: $GPG_PASSPHRASE
#    %no-protection
#    %no-ask-passphrase
#    %pubring .pubring.gpg
#    %secring .secring.gpg
#    Do a commit here, so that we can later print "done" :-)
    %commit
    %echo done
EOF

gpg --verbose --batch --gen-key keydetails

KEY_ID=$(gpg --list-secret-keys | head -4 | tail -1 | sed "s/ //g")

echo "Key Id: $KEY_ID"

gpg --keyserver hkp://pool.sks-keyservers.net --send-keys "$KEY_ID"

gpg --send-keys --keyserver keyserver.ubuntu.com "$KEY_ID"

cp -R $HOME/.gnupg/trustdb.gpg secring.gpg
gpg --armor --export bot.bhuwan@gmail.com > public.asc
rm -rf $HOME/.gnupg