import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

import '../../bloc/blocs.dart';
import '../../core/service/locator.dart';
import '../../core/service/services.dart';
import '../../model/despesa_model.dart';
import '../../page/page_connected.dart';
import 'post_despesa.dart';

class PostDespesaConnected extends StatelessWidget {
  PostDespesaConnected(this.despesa);

  final DespesaModel despesa;

  @override
  Widget build(BuildContext context) {
    return PageConnected<DespesaImageBloc>(
      bloc: DespesaImageBloc(
        urlLaunchService: G<UrlLauncherService>(),
      ),
      page: PostDespesa(
        despesa,
        screenshotController: ScreenshotController(),
      ),
    );
  }
}
