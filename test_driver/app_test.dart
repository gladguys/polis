import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:polis/core/i18n/i18n.dart';
import 'package:test/test.dart';

void main() {
  var i = 1;

  group('Flutter Driver tests', () {
    FlutterDriver driver;

    setUpAll(() async {
      Directory('screenshots').create();
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    Future<void> takeScreenshot(FlutterDriver driver, String filename) async {
      final pixels = await driver.screenshot();
      final file = File('screenshots/${i}_$filename.png');
      await file.writeAsBytes(pixels);
      i++;
    }

    test('check flutter driver health', () async {
      final health = await driver.checkHealth();
      print(health.status);
    });

    test('should land on InitialPage', () async {
      await takeScreenshot(driver, 'INITIAL_PAGE');
      expect(driver.waitFor(find.byType('InitialPage')), completes);
    });

    test('should alert that user already exists', () async {
      await driver.tap(find.byValueKey('no-account-btn'));

      await takeScreenshot(driver, 'SIGNUP_PAGE');

      await driver.tap(find.byValueKey('name-field'));
      await driver.enterText('Rodrigo Bastos Vasconcelos');
      await driver.waitFor(find.text('Rodrigo Bastos Vasconcelos'));

      await driver.tap(find.byValueKey('email-field'));
      await driver.enterText('rodrigobastosv@gmail.com');
      await driver.waitFor(find.text('rodrigobastosv@gmail.com'));

      await driver.tap(find.byValueKey('password-field'));
      await driver.enterText('a good password');
      await driver.waitFor(find.text('a good password'));

      await driver.tap(find.byValueKey('confirm-password-field'));
      await driver.enterText('a good password');
      await driver.waitFor(find.text('a good password'));

      await takeScreenshot(driver, 'FILL_SIGNUP_PAGE');

      await driver.waitFor(find.byValueKey('signup-btn'));
      await driver.tap(find.byValueKey('signup-btn'));
      await driver.waitUntilNoTransientCallbacks();

      await driver.waitFor(
        find.text(EMAIL_ALREADY_IN_USE),
        timeout: const Duration(
          seconds: 3,
        ),
      );

      await takeScreenshot(driver, 'EMAIL_ALREADY_USED');

      await driver.scroll(
        find.byType('SlidingPanel'),
        0,
        800,
        const Duration(
          milliseconds: 200,
        ),
      );

      await takeScreenshot(driver, 'BACK_TO_INITIAL_PAGE');
    });

    test('should login with an existent user', () async {
      await driver.tap(find.byValueKey('signin-btn'));

      await takeScreenshot(driver, 'SIGNIN_PAGE');

      await driver.tap(find.byValueKey('email-field'));
      await driver.enterText('rodrigobastosv@gmail.com');
      await driver.waitFor(find.text('rodrigobastosv@gmail.com'));

      await driver.tap(find.byValueKey('password-field'));
      await driver.enterText('123456');
      await driver.waitFor(find.text('123456'));

      await takeScreenshot(driver, 'FILL_SIGNIN_PAGE');

      await driver.waitFor(find.byValueKey('signin-btn'));
      await driver.tap(find.byValueKey('signin-btn'));
      await driver.waitUntilNoTransientCallbacks();

      await takeScreenshot(driver, 'EMPTY_TIMELINE');
    });
  });
}
