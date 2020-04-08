import 'package:polis/core/validators.dart';
import 'package:test/test.dart';

void main() {
  group('Validators tests', () {
    group('validateEmail', () {
      test('should return true when validating valid email', () {
        final email = 'rod@gmail.com';
        expect(Validators.validateEmail(email), true);
      });

      test('should return false when validating invalid email', () {
        final email = 'rod@gmail.';
        final email2 = 'rodgmail.com';
        final email3 = '@gmail.com';
        final email4 = 'r@com';
        expect(Validators.validateEmail(email), false);
        expect(Validators.validateEmail(email2), false);
        expect(Validators.validateEmail(email3), false);
        expect(Validators.validateEmail(email4), false);
      });

      test('should return false when email isEmpty or null', () {
        final email = '';
        final email2 = null;
        expect(Validators.validateEmail(email), false);
        expect(Validators.validateEmail(email2), false);
      });
    });
  });
}
