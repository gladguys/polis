#!/bin/bash

cd ..
flutter pub run build_runner build --delete-conflicting-outputs
flutter run --flavor dev -t lib/main_local.dart
