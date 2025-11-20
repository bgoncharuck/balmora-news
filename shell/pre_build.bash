#!/bin/bash

# 1. Remove .env from pubspec.yaml
PUBSPEC_FILE="pubspec.yaml"
if [ "$(uname)" == "Darwin" ]; then
    sed -i '' "/- \.env/s/^/#/" $PUBSPEC_FILE
else
    sed -i "/- \.env/s/^/#/" $PUBSPEC_FILE
fi

flutter pub get

# 2.