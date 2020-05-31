import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../core/domain/model/models.dart';
import '../../core/repository/concrete/repositories.dart';
import '../../core/service/locator.dart';
import '../../core/service/services.dart';
import '../../page/page_connected.dart';
import 'favorite_proposta_tile.dart';

class FavoritePropostaTileConnected extends StatelessWidget {
  const FavoritePropostaTileConnected(
    this.proposta, {
    this.clickableImage = true,
  });

  final PropostaModel proposta;
  final bool clickableImage;

  @override
  Widget build(BuildContext context) {
    return PageConnected<PostBloc>(
      bloc: PostBloc(
        post: proposta.toJson(),
        postRepository: context.repository<FirebasePostRepository>(),
        shareService: G<ShareService>(),
      ),
      page: FavoritePropostaTile(proposta, clickableImage: clickableImage),
    );
  }
}
