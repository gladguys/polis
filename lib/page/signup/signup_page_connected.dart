import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sliding_panel/sliding_panel.dart';

import '../../bloc/blocs.dart';
import '../../core/repository/concrete/repositories.dart';
import '../../core/service/locator.dart';
import '../../core/service/services.dart';
import '../page_connected.dart';
import '../pages.dart';

class SignupPageConnected extends StatelessWidget {
  const SignupPageConnected({
    @required this.panelController,
  }) : assert(panelController != null);

  final PanelController panelController;

  @override
  Widget build(BuildContext context) {
    return PageConnected<SignupBloc>(
      bloc: SignupBloc(
        repository: context.repository<FirebaseSignupRepository>(),
        analyticsService: G<AnalyticsService>(),
      ),
      page: SignupPage(
        imagePicker: ImagePicker(),
        panelController: panelController,
      ),
    );
  }
}
