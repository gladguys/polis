import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonActionCard extends StatelessWidget {
  const ButtonActionCard({
    @required this.icon,
    @required this.onTap,
    this.text,
    this.fontSize = 12,
    this.iconColor,
    this.textColor = Colors.black,
    this.isIconOnly = false,
  })  : assert(icon != null),
        assert(onTap != null);

  final IconData icon;
  final String text;
  final double fontSize;
  final Color iconColor;
  final Color textColor;
  final bool isIconOnly;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return isIconOnly ? _buildIcon() : _buildIconAndText();
  }

  Widget _buildIcon() {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: 30,
        height: 30,
        alignment: Alignment.center,
        child: FaIcon(
          icon,
          size: 20,
          color: iconColor,
        ),
      ),
      onTap: onTap,
    );
  }

  Widget _buildIconAndText() {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 50),
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 6,
            children: <Widget>[
              FaIcon(
                icon,
                size: 18,
                color: iconColor,
              ),
              Text(
                text ?? '',
                style: TextStyle(fontSize: fontSize, color: textColor),
              ),
            ],
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
