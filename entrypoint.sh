#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo ${GPG_PRIVATE_KEY?"please set GPG_PRIVATE_KEY"}
echo ${GPG_KEY_GRIP?"please set GPG_KEY_GRIP"}
echo ${GPG_KEY_PASS?"please set GPG_KEY_PASS"}

echo "$GPG_PRIVATE_KEY" | base64 -d > "$HOME"/git-crypt-key.asc
gpg --batch --import "$HOME"/git-crypt-key.asc

gpgconf --kill gpg-agent
gpg-agent --daemon --allow-preset-passphrase --max-cache-ttl 3153600000
/usr/lib/gnupg2/gpg-preset-passphrase --preset --passphrase "$GPG_KEY_PASS" "$GPG_KEY_GRIP"

git-crypt unlock

rm "$HOME"/git-crypt-key.asc
