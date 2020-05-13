import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({@required this.width, @required this.height})
      : assert(width != null),
        assert(height != null);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(60),
      child: SkeletonAnimation(
        shimmerColor: Colors.grey[350].withOpacity(.5),
        gradientColor: Colors.grey[350].withOpacity(.1),
        curve: Curves.linear,
        child: Container(
          width: width,
          height: height,
          color: Colors.grey[300],
        ),
      ),
    );
  }
}
