import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Photo extends StatelessWidget {
  const Photo({
    this.url,
    this.size = 48,
    this.borderRadius,
    this.backgroundColor = Colors.white,
    this.boxFit = BoxFit.contain,
  });

  final String url;
  final double size;
  final BorderRadius borderRadius;
  final Color backgroundColor;
  final BoxFit boxFit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(24),
      child: url != null
          ? Container(
              color: backgroundColor,
              child: FancyShimmerImage(
                imageUrl: url,
                width: size,
                height: size,
                boxFit: boxFit,
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
