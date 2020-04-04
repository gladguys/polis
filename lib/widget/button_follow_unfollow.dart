import 'package:flutter/material.dart';

import '../i18n/i18n.dart';

class ButtonFollowUnfollow extends StatelessWidget {
  const ButtonFollowUnfollow({
    @required this.isFollow,
    @required this.onPressed,
    this.key,
  })  : assert(isFollow != null),
        assert(onPressed != null);

  final bool isFollow;
  final Key key;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    final Color color = isFollow ? Colors.red : Colors.green;

    return Container(
      width: 110,
      height: 22,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        child: Text(
          isFollow ? STOP_FOLLOWING : FOLLOW,
          key: key,
          style: const TextStyle(fontSize: 11),
        ),
        textColor: color,
        borderSide: BorderSide(color: color),
        highlightedBorderColor: color,
        onPressed: onPressed,
      ),
    );
  }
}
