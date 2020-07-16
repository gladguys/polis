import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../core/constants.dart';
import '../core/i18n/i18n.dart';

class EmptyInfo extends StatelessWidget {
  EmptyInfo({this.imageName, this.icon, @required this.text})
      : assert(text != null),
        assert(
            !(imageName == null && icon == null), ASSERT_ATLEAST_IMAGE_OR_ICON),
        assert(!(imageName != null && icon != null),
            ASSERT_IMAGE_AND_ICON_NOT_PRESENT);

  final String imageName;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          imageName != null
              ? Image.asset(
                  '$kImagesPath/$imageName',
                  height: 120,
                  width: 120,
                )
              : FaIcon(
                  icon,
                  size: 80,
                  color: Theme.of(context).primaryColorLight,
                ),
          const SizedBox(height: 12),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
