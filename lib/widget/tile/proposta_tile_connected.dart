import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cubits.dart';
import '../../core/domain/model/models.dart';
import '../../core/repository/concrete/repositories.dart';
import '../../core/service/locator.dart';
import '../../core/service/services.dart';
import '../../page/page_connected.dart';
import 'proposta_tile.dart';

class PropostaTileConnected extends StatelessWidget {
  const PropostaTileConnected(
    this.proposta, {
    this.clickableImage = true,
  });

  final PropostaModel proposta;
  final bool clickableImage;

  @override
  Widget build(BuildContext context) {
    return PageConnected<PostCubit>(
      bloc: PostCubit(
        post: proposta.toJson(),
        postRepository: context.repository<FirebasePostRepository>(),
        actionRepository: context.repository<FirebaseActionRepository>(),
        shareService: G<ShareService>(),
        userCubit: context.bloc<UserCubit>(),
        timelineCubit: context.bloc<TimelineCubit>(),
      ),
      page: PropostaTile(proposta, clickableImage: clickableImage),
    );
  }
}
