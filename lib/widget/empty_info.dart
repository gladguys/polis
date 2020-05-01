import 'package:flutter/material.dart';

import '../core/constants.dart';
import '../i18n/i18n.dart';

class EmptyInfo extends StatelessWidget {
  EmptyInfo({this.imageName, this.icon, @required this.text})
      : assert(text != null),
        assert(imageName != null || icon != null, ASSERT_ATLEAST_IMAGE_OR_ICON),
        assert(!(imageName == null && icon == null),
            ASSERT_IMAGE_AND_ICON_NOT_PRESENT);

  final String imageName;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height / 5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          imageName != null
              ? Image.asset(
                  '$kImagesPath/$imageName',
                  height: 120,
                  width: 120,
                )
              : Icon(icon, size: 120),
          const SizedBox(height: 18),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
