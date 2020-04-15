import 'dart:io';

import 'package:esys_flutter_share/esys_flutter_share.dart';

class ShareService {
  Future<void> shareFile(File file,
      {String title, String name, String mimeType = 'image/png'}) async {
    await Share.file(title, name, file.readAsBytesSync(), mimeType);
  }
}
