#!/bin/bash

rsync -av --exclude='.git' --exclude='installed.txt' --exclude='test.csv' . ~
