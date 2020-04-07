import 'package:flutter/material.dart';

class ButtonActionCard extends StatelessWidget {
  const ButtonActionCard({
    @required this.icon,
    @required this.onTap,
    this.paddingIcon = EdgeInsets.zero,
    this.isIconOnly = false,
  })  : assert(icon != null),
        assert(onTap != null);

  final Icon icon;
  final EdgeInsets paddingIcon;
  final bool isIconOnly;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return isIconOnly ? _buildIcon() : _buildIconAndText();
  }

  Widget _buildIcon() {
    return InkWell(
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Padding(
          padding: paddingIcon,
          child: icon,
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
            spacing: 4,
            children: <Widget>[
              Padding(
                padding: paddingIcon,
                child: icon,
              ),
            ],
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
