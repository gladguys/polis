import 'package:flutter/material.dart';

import '../../core/domain/enum/post_type.dart';
import '../../widget/post/post_despesa_connected.dart';
import '../../widget/post/post_proposta_connected.dart';
import '../pages.dart';

class PostPage extends StatelessWidget {
  PostPage({@required this.post, @required this.postType})
      : assert(post != null),
        assert(postType != null);

  final dynamic post;
  final PostType postType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  postType == PostType.DESPESA
                      ? PostDespesaConnected(post)
                      : PostPropostaConnected(post),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  PostCommentsConnected(post: post),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
