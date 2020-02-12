#!/bin/bash

cd ..
/home/juarez/Downloads/flutter_linux_v1.9.1+hotfix.2-stable/flutter/bin/flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
