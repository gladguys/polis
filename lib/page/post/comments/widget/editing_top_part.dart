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
        const Divider(height: 1),
        const SizedBox(height: 8),
        Container(
          width: 360,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FaIcon(
                FontAwesomeIcons.pen,
                size: 16,
              ),
              const SizedBox(width: 8),
              Text(
                '$EDIT_COMMENT:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Material(
                borderRadius: BorderRadius.circular(11),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  child: Container(
                    width: 22,
                    height: 22,
                    alignment: Alignment.center,
                    child: FaIcon(
                      FontAwesomeIcons.times,
                      size: 20,
                    ),
                  ),
                  onTap: onCancelEditing,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: 360,
          child: Text(
            text,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
