import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

import '../../bloc/cubits.dart';
import '../../core/domain/model/models.dart';
import '../../core/service/locator.dart';
import '../../core/service/services.dart';
import '../../page/page_connected.dart';
import 'post_proposta.dart';

class PostPropostaConnected extends StatelessWidget {
  PostPropostaConnected(this.proposta, {this.isPostPreview = false});

  final PropostaModel proposta;
  final bool isPostPreview;

  @override
  Widget build(BuildContext context) {
    return PageConnected<DocumentCubit>(
      bloc: DocumentCubit(
        urlLaunchService: G<UrlLauncherService>(),
      ),
      page: PostProposta(
        proposta,
        screenshotController: ScreenshotController(),
        isPostPreview: isPostPreview,
      ),
    );
  }
}
