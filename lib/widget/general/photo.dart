import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../image/photo_image.dart';

class Photo extends StatelessWidget {
  const Photo({
    this.url,
    this.size = 48,
    this.borderRadius,
    this.backgroundColor = Colors.white,
    this.iconColor,
    this.iconKey,
    this.boxFit = BoxFit.contain,
  });

  final String url;
  final double size;
  final BorderRadius borderRadius;
  final Color backgroundColor;
  final Color iconColor;
  final Key iconKey;
  final BoxFit boxFit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(24),
      child: url != null
          ? Container(
              color: backgroundColor,
              child: PhotoImage(
                url: url,
                size: size,
                boxFit: boxFit,
              ),
            )
          : FaIcon(
              FontAwesomeIcons.solidUserCircle,
              color: iconColor != null ? iconColor : Colors.grey[400],
              size: size,
              key: iconKey,
            ),
    );
  }
}
