import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PhotoPolitic extends StatelessWidget {
  const PhotoPolitic({
    this.urlPhoto,
    this.size = 48,
    this.borderRadius,
  });

  final String urlPhoto;
  final double size;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(24),
      child: urlPhoto != null
          ? Container(
              color: Colors.white,
              child: FancyShimmerImage(
                imageUrl: urlPhoto,
                width: size,
                height: size,
                boxFit: BoxFit.contain,
              ),
            )
          : FaIcon(
              FontAwesomeIcons.solidUserCircle,
              color: Colors.grey[400],
              size: size,
            ),
    );
  }
}
