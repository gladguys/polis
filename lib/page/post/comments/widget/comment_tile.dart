import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_router/simple_router.dart';

import '../../../../bloc/blocs.dart';
import '../../../../core/domain/model/comment_model.dart';
import '../../../../core/routing/route_names.dart';
import '../../../pages.dart';

class CommentTile extends StatelessWidget {
  CommentTile(this.comment);

  final CommentModel comment;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(comment.texto),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 80,
            child: GestureDetector(
              onTap: () => SimpleRouter.forward(
                CommentRepliesPageConnected(
                  post: context.bloc<CommentBloc>().post,
                  comment: comment,
                  commentBloc: context.bloc<CommentBloc>(),
                ),
                name: COMMENT_REPLIES_PAGE,
              ),
              child: Row(
                children: <Widget>[
                  Icon(Icons.comment),
                  const SizedBox(width: 8),
                  Text(
                    comment.respostas == null
                        ? '0'
                        : comment.respostas.length.toString(),
                  )
                ],
              ),
            ),
          ),
          Text('${DateTime.now().toString()}'),
        ],
      ),
    );
  }
}
