import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class LogoPartidoImage extends FancyShimmerImage {
  LogoPartidoImage({
    @required String logoPartido,
    @required double size,
    BoxFit boxFit = BoxFit.contain,
  })  : assert(logoPartido != null),
        assert(size != null && size > 0),
        super(
          imageUrl: logoPartido,
          height: size,
          width: size,
          boxFit: boxFit,
          errorWidget: Container(
            child: const Center(
              child: Icon(
                Icons.flag,
                color: Colors.amber,
              ),
            ),
          ),
        );
}
