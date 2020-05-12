import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../core/service/locator.dart';
import '../../core/service/services.dart';
import '../../model/models.dart';
import '../../page/page_connected.dart';
import '../../repository/concrete/repositories.dart';
import 'politic_proposta_tile.dart';

class PoliticPropostaTileConnected extends StatelessWidget {
  const PoliticPropostaTileConnected(
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
      page: PoliticPropostaTile(proposta, clickableImage: clickableImage),
    );
  }
}
