import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/routing/route_names.dart';
import '../../enum/post_type.dart';
import '../../i18n/label.dart';
import '../../widget/default_bottombar.dart';
import '../../widget/field_rounded.dart';
import '../../widget/tile/despesa_tile_connected.dart';
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
            const SizedBox(height: 16),
            Expanded(
              child: postType == PostType.DESPESA
                  ? DespesaTileConnected(post)
                  : PropostaTile(post),
            ),
            const Divider(color: Colors.grey, height: 1),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: FieldRounded(
                hintText: COMMENT_HERE,
                width: 360,
                iconSuffix: FontAwesomeIcons.solidPaperPlane,
                keySuffix: const ValueKey('comment-button'),
                onPressedSuffix: () {},
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
