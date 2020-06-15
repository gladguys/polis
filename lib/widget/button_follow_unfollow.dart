import 'package:flutter/material.dart';

import '../core/i18n/i18n.dart';

class ButtonFollowUnfollow extends StatefulWidget {
  ButtonFollowUnfollow({
    @required this.isFollow,
    @required this.onPressed,
    this.isOutline = true,
    this.width = 100,
    this.height = 26,
    this.fontSize = 12,
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
  _ButtonFollowUnfollowState createState() => _ButtonFollowUnfollowState();
}

class _ButtonFollowUnfollowState extends State<ButtonFollowUnfollow>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Size> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _animation = Tween<Size>(
      begin: Size(widget.width, widget.height),
      end: Size(widget.width + 30, widget.height + 10),
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInSine),
    );
    _controller.addListener(() => setState(() {}));
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color color = widget.isFollow ? Colors.red : Colors.green;
    return AnimatedBuilder(
      animation: _animation,
      builder: (ctx, ch) => Container(
        width: _animation.value.width,
        height: _animation.value.height,
        child: widget.isOutline && widget.isFollow
            ? _buildOutlineButton(color)
            : _buildFlatButton(color),
      ),
    );
  }

  Widget _buildOutlineButton(Color color) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        child: Text(
          widget.isFollow ? STOP_FOLLOWING : FOLLOW,
          key: widget.key,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: widget.fontSize - 1),
        ),
        textColor: color,
        highlightedBorderColor: color,
        onPressed: () {
          _controller.forward();
          widget.onPressed();
        },
      ),
    );
  }

  Widget _buildFlatButton(Color color) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: FlatButton(
        key: widget.key,
        padding: EdgeInsets.zero,
        child: Text(
          widget.isFollow ? STOP_FOLLOWING : FOLLOW,
          style: TextStyle(fontSize: widget.fontSize),
        ),
        textColor: Colors.white,
        color: color,
        onPressed: () {
          _controller.forward();
          widget.onPressed();
        },
      ),
    );
  }
}
