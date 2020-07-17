import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/i18n/i18n.dart';

class EditingTopPart extends StatelessWidget {
  EditingTopPart(
      {@required this.text,
      @required this.commentInputController,
      @required this.onCancelEditing})
      : assert(text != null),
        assert(commentInputController != null),
        assert(onCancelEditing != null);

  final String text;
  final TextEditingController commentInputController;
  final Function onCancelEditing;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Divider(color: Colors.grey, height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: 360,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FaIcon(
                FontAwesomeIcons.pen,
                size: 16,
              ),
              const SizedBox(width: 8),
              Text(
                '$EDIT_COMMENT:',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    text,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.cancel),
                onPressed: onCancelEditing,
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
