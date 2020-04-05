import 'package:flutter/material.dart';

import '../../core/routing/route_names.dart';
import '../../enum/post_type.dart';
import '../../widget/default_bottombar.dart';
import '../../widget/tile/despesa_tile.dart';
import '../../widget/tile/proposta_tile.dart';

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
          postType == PostType.DESPESA ? DespesaTile(post) : PropostaTile(post),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Escrever comentário...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                suffixIcon: Icon(
                  Icons.send,
                  size: 26,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
