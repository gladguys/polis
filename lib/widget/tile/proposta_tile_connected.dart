import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../model/models.dart';
import '../../page/page_connected.dart';
import '../../repository/concrete/repositories.dart';
import 'proposta_tile.dart';
import 'proposta_tile_complete.dart';

class PropostaTileConnected extends StatelessWidget {
  PropostaTileConnected(
    this.proposta, {
    this.clickableImage = true,
    this.isComplete = false,
  });

  final PropostaModel proposta;
  final bool clickableImage;
  final bool isComplete;

  @override
  Widget build(BuildContext context) {
    return PageConnected<PostBloc>(
      bloc: PostBloc(
        post: proposta.toJson(),
        postRepository: context.repository<FirebasePostRepository>(),
      ),
      page: isComplete
          ? PropostaTileComplete(proposta, clickableImage: clickableImage)
          : PropostaTile(proposta, clickableImage: clickableImage),
    );
  }
}
