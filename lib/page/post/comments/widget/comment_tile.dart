import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_router/simple_router.dart';

import '../../../../bloc/blocs.dart';
import '../../../../core/domain/model/comment_model.dart';
import '../../../../core/extension/extensions.dart';
import '../../../../core/routing/route_names.dart';
import '../../../pages.dart';

class CommentTile extends StatelessWidget {
  CommentTile(this.comment);

  final CommentModel comment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          color: Color(0xFFFFF5D0),
        ),
        child: ListTile(
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
                      FaIcon(
                        FontAwesomeIcons.comment,
                        size: 16,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        comment.respostas == null
                            ? '0'
                            : comment.respostas.length.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Text('${DateTime.now().toString().formatDateTime()}'),
            ],
          ),
        ),
      ),
    );
  }
}
