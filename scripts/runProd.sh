#!/bin/bash

cd ..
flutter pub run build_runner build --delete-conflicting-outputs
flutter run --flavor prod -t lib/main_prod.dart
