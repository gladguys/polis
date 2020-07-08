import 'package:flutter/material.dart';

import '../../../../core/i18n/i18n.dart';

enum CommentOption {
  edit,
  delete,
}

String commentOptionToString(CommentOption option) {
  return option == CommentOption.edit ? EDIT : DELETE;
}

class MenuEditDeleteComment extends StatelessWidget {
  MenuEditDeleteComment({@required this.onEdit, @required this.onDelete})
      : assert(onEdit != null),
        assert(onDelete != null);

  final Function onEdit;
  final Function onDelete;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<CommentOption>(
      itemBuilder: (_) => [
        CommentOption.edit,
        CommentOption.delete,
      ]
          .map(
            (option) => PopupMenuItem(
              child: Row(
                children: <Widget>[
                  Icon(
                    option == CommentOption.edit ? Icons.edit : Icons.delete,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    commentOptionToString(option),
                  )
                ],
              ),
              value: option,
            ),
          )
          .toList(),
      onSelected: (option) {
        if (option == CommentOption.edit) {
          onEdit();
        } else if (option == CommentOption.delete) {
          onDelete();
        }
      },
      icon: Icon(Icons.menu),
    );
  }
}
