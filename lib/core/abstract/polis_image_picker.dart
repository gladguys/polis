import 'dart:io';

import 'package:image_picker/image_picker.dart';

class PolisImagePicker {
  Future<File> getImage() async {
    return await ImagePicker.pickImage(source: ImageSource.camera);
  }
}
