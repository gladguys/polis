import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PhotoImage extends FancyShimmerImage {
  PhotoImage({
    @required String url,
    @required double size,
    BoxFit boxFit = BoxFit.contain,
    Color iconColor,
    Key iconKey,
  })  : assert(url != null),
        assert(size != null && size > 0),
        super(
          imageUrl: url,
          width: size,
          height: size,
          boxFit: boxFit,
          errorWidget: FaIcon(
            FontAwesomeIcons.solidUserCircle,
            color: iconColor != null ? iconColor : Colors.grey[400],
            size: size,
            key: iconKey,
          ),
        );
}
