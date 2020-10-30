#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "git-crypt lock"
git-crypt lock
