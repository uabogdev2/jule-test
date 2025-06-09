#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

echo "INFO: Ensuring Flutter project is properly initialized..."
# Check if pubspec.yaml exists, if not, try to run flutter create
if [ ! -f pubspec.yaml ]; then
    echo "WARN: pubspec.yaml not found. Attempting to run 'flutter create .'"
    flutter create --project-name cercle_mystique .
    if [ ! -f pubspec.yaml ]; then
        echo "ERROR: 'flutter create .' failed to create pubspec.yaml. Exiting."
        exit 1
    fi
else
    echo "INFO: pubspec.yaml found."
fi

echo "INFO: Downloading dependencies..."
flutter pub get

echo "INFO: Running static analysis..."
flutter analyze

echo "INFO: Running tests..."
flutter test

echo "SUCCESS: All checks passed!"
