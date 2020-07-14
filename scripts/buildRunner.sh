#!/bin/bash

cd ..
echo '############################### Generating files #############################'
flutter pub run build_runner build --delete-conflicting-outputs

