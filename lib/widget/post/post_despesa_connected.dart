import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

import '../../bloc/cubits.dart';
import '../../core/domain/model/despesa_model.dart';
import '../../core/service/locator.dart';
import '../../core/service/services.dart';
import '../../page/page_connected.dart';
import 'post_despesa.dart';

class PostDespesaConnected extends StatelessWidget {
  PostDespesaConnected(this.despesa, {this.isPostPreview = false});

  final DespesaModel despesa;
  final bool isPostPreview;

  @override
  Widget build(BuildContext context) {
    return PageConnected<DocumentCubit>(
      bloc: DocumentCubit(
        urlLaunchService: G<UrlLauncherService>(),
      ),
      page: PostDespesa(
        despesa,
        screenshotController: ScreenshotController(),
        isPostPreview: isPostPreview,
      ),
    );
  }
}
