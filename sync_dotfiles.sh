#!/bin/bash

rsync -av --exclude='.git' --exclude='installed.txt' --exclude='sync_dotfiles.sh' . ~
