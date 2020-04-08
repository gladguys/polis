import 'package:flutter/material.dart';

import '../i18n/i18n.dart';

class ButtonFollowUnfollow extends StatelessWidget {
  ButtonFollowUnfollow({
    @required this.isFollow,
    @required this.onPressed,
    this.isOutline = true,
    this.width = 110,
    this.height = 22,
    this.fontSize = 11,
    this.key,
  })  : assert(isFollow != null),
        assert(onPressed != null);

  final bool isFollow;
  final bool isOutline;
  final double width;
  final double height;
  final double fontSize;
  final Key key;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    final Color color = isFollow ? Colors.red : Colors.green;

    return isOutline ? _buildOutlineButton(color) : _buildFlatButton(color);
  }

  Widget _buildOutlineButton(Color color) {
    return Container(
      width: width,
      height: height,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        child: Text(
          isFollow ? STOP_FOLLOWING : FOLLOW,
          key: key,
          style: TextStyle(fontSize: fontSize),
        ),
        textColor: color,
        highlightedBorderColor: color,
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildFlatButton(Color color) {
    return Container(
      width: width,
      height: height,
      child: FlatButton(
        key: key,
        padding: EdgeInsets.zero,
        child: Text(
          isFollow ? STOP_FOLLOWING : FOLLOW,
          style: TextStyle(fontSize: fontSize),
        ),
        textColor: Colors.white,
        color: color,
        onPressed: onPressed,
      ),
    );
  }
}
