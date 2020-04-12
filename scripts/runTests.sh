#!/bin/bash

cd ..
flutter test --coverage
flutter pub global run remove_from_coverage:remove_from_coverage -f coverage/lcov.info -r '.g.dart$'
genhtml coverage/lcov.info -o coverage/html
