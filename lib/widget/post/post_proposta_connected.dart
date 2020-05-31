import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

import '../../bloc/blocs.dart';
import '../../core/domain/model/models.dart';
import '../../core/service/locator.dart';
import '../../core/service/services.dart';
import '../../page/page_connected.dart';
import 'post_proposta.dart';

class PostPropostaConnected extends StatelessWidget {
  PostPropostaConnected(this.proposta);

  final PropostaModel proposta;

  @override
  Widget build(BuildContext context) {
    return PageConnected<DocumentBloc>(
      bloc: DocumentBloc(
        urlLaunchService: G<UrlLauncherService>(),
      ),
      page: PostProposta(
        proposta,
        screenshotController: ScreenshotController(),
      ),
    );
  }
}
