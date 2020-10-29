#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo ${GPG_PRIVATE_KEY?"please set GPG_PRIVATE_KEY"}
echo ${GPG_KEY_GRIP?"please set GPG_KEY_GRIP"}
echo ${GPG_KEY_PASS?"please set GPG_KEY_PASS"}

