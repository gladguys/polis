import 'package:flutter/material.dart';

import '../../core/routing/route_names.dart';
import '../../enum/post_type.dart';
import '../../widget/default_bottombar.dart';
import 'widget/post_despesa.dart';
import 'widget/post_proposta.dart';

class PostPage extends StatelessWidget {
  PostPage({@required this.post, @required this.postType})
      : assert(post != null),
        assert(postType != null);

  final dynamic post;
  final PostType postType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DefaultBottombar(TIMELINE_PAGE, withBack: true),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 8),
            Expanded(
              child: postType == PostType.DESPESA
                  ? PostDespesa(post)
                  : PostProposta(post),
            ),
            /*
            ESCONDIDO ENQUANTO NÃO IMPLEMENTADO
            const Divider(color: Colors.grey, height: 1),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: FieldRounded(
                hintText: COMMENT_HERE,
                width: 360,
                textSuffix: SEND,
                widthSuffix: 70,
                keySuffix: const ValueKey('comment-button'),
                onPressedSuffix: () {},
              ),
            ),
            const SizedBox(height: 12),
            */
          ],
        ),
      ),
    );
  }
}
