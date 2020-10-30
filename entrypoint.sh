#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo ${GPG_PRIVATE_KEY?"please set GPG_PRIVATE_KEY"} > /dev/null
echo ${GPG_KEY_GRIP?"please set GPG_KEY_GRIP"} > /dev/null
echo ${GPG_KEY_PASS?"please set GPG_KEY_PASS"} > /dev/null

echo "$GPG_PRIVATE_KEY" | base64 -d > "$HOME"/git-crypt-key.asc
gpg --batch --import "$HOME"/git-crypt-key.asc

echo "gpg --with-keygrip --list-secret-keys"
gpg --with-keygrip --list-secret-keys

echo "GPG_KEY_GRIP: $GPG_KEY_GRIP"

gpgconf --kill gpg-agent
gpg-agent --daemon --allow-preset-passphrase --max-cache-ttl 3153600000

echo"/usr/lib/gnupg2/gpg-preset-passphrase --preset --passphrase \$GPG_KEY_PASS \$GPG_KEY_GRIP"
/usr/lib/gnupg2/gpg-preset-passphrase --preset --passphrase "$GPG_KEY_PASS" "$GPG_KEY_GRIP"

echo "git-crypt unlock"
git-crypt unlock

rm "$HOME"/git-crypt-key.asc
