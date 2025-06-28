#!/bin/bash

# SnapTrack v1.1 - Quick Start Script
# Simple script to quickly run the app

# Set Flutter path
export PATH="$PATH:/opt/flutter/bin"

# Check if build exists
if [ ! -f "./build/linux/x64/release/bundle/snaptrack" ]; then
    echo "🔨 Building SnapTrack for the first time..."
    flutter pub get
    flutter pub run build_runner build --delete-conflicting-outputs
    flutter build linux
fi

# Make executable and run
chmod +x ./build/linux/x64/release/bundle/snaptrack
echo "🚀 Starting SnapTrack v1.1..."
./build/linux/x64/release/bundle/snaptrack