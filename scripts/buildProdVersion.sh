#!/bin/bash

cd ..
flutter clean
flutter build appbundle --flavor prod -t lib/main_prod.dart