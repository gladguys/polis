import 'package:flutter_test/flutter_test.dart';
import 'package:polis/widget/image/logo_partido_image.dart';

void main() {
  group('LogoPartidoImage tests', () {
    test('assert', () {
      expect(
          () => LogoPartidoImage(
                logoPartido: null,
                size: 80,
              ),
          throwsAssertionError);
      expect(
          () => LogoPartidoImage(
                logoPartido: '',
                size: null,
              ),
          throwsAssertionError);
      expect(
          () => LogoPartidoImage(
                logoPartido: '',
                size: 0,
              ),
          throwsAssertionError);
    });
  });
}
