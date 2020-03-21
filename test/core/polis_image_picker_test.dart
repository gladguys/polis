import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:polis/core/abstract/polis_image_picker.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  PolisImagePicker polisImagePicker;
  MethodChannel channel;

  group('PolisImagePicker tests', () {
    setUp(() {
      channel = const MethodChannel('plugins.flutter.io/image_picker');
      polisImagePicker = PolisImagePicker();
      channel.setMockMethodCallHandler((methodCall) async {
        return 'image';
      });
    });

    test('getImage', () {
      polisImagePicker.getImage();
    });
  });
}
