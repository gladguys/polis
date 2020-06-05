import 'dart:io';

import 'package:image_picker/image_picker.dart';

class PolisImagePicker {
  Future<File> getImage() async {
    // TODO(rodrigo): Refactor this use
    // ignore: deprecated_member_use
    return await ImagePicker.pickImage(source: ImageSource.camera);
  }
}
