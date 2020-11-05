#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "git-crypt lock --force"
git-crypt lock --force
