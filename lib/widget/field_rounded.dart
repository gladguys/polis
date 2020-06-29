import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../page/theme/main_theme.dart';

class FieldRounded extends StatelessWidget {
  const FieldRounded({
    this.width,
    this.key,
    this.keySuffix,
    this.iconPrefix,
    this.iconSuffix,
    this.textSuffix,
    this.widthSuffix,
    this.backgroundColorSuffix,
    this.hintText,
    this.onChanged,
    this.onPressedSuffix,
    this.controller,
  });

  final double width;
  final Key key;
  final Key keySuffix;
  final IconData iconPrefix;
  final IconData iconSuffix;
  final String textSuffix;
  final double widthSuffix;
  final Color backgroundColorSuffix;
  final String hintText;
  final Function onChanged;
  final Function onPressedSuffix;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final paddingLeft = iconPrefix != null ? 36.0 : 16.0;
    final paddingRight = iconSuffix != null ? 48.0 : 16.0;

    return Stack(
      children: <Widget>[
        Container(
          height: 40,
          width: width,
          child: TextField(
            controller: controller,
            key: key,
            style: const TextStyle(fontSize: 14),
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding:
                  EdgeInsets.fromLTRB(paddingLeft, 24, paddingRight, 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onChanged: onChanged,
          ),
        ),
        if (iconPrefix != null)
          Positioned(
            left: 3,
            top: 0,
            child: Container(
              width: 36,
              height: 38,
              alignment: Alignment.center,
              child: FaIcon(
                iconPrefix,
                size: 16,
                color: Colors.grey[600],
              ),
            ),
          ),
        if (textSuffix != null)
          Positioned(
            right: 5,
            top: 5,
            child: Container(
              height: 30,
              width: widthSuffix,
              alignment: Alignment.center,
              child: FlatButton(
                color: theme.primaryColor,
                padding: EdgeInsets.zero,
                child: Text(
                  textSuffix,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: onPressedSuffix,
              ),
            ),
          ),
        if (iconSuffix != null)
          Positioned(
            right: 5,
            top: 5,
            child: Container(
              width: 48,
              height: 30,
              alignment: Alignment.center,
              child: FlatButton(
                color: backgroundColorSuffix,
                padding: EdgeInsets.zero,
                child: FaIcon(
                  iconSuffix,
                  key: keySuffix,
                  size: 16,
                  color: Colors.black,
                ),
                onPressed: onPressedSuffix,
              ),
            ),
          ),
      ],
    );
  }
}
