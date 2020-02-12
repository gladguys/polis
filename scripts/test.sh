#!/bin/bash

cd ..
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
