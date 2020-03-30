import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../core/abstract/polis_image_picker.dart';
import '../../core/service/locator.dart';
import '../../core/service/services.dart';
import '../../repository/concrete/repositories.dart';
import '../page_connected.dart';
import '../pages.dart';

class SignupPageConnected extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageConnected<SignupBloc>(
      bloc: SignupBloc(
        repository: context.repository<FirebaseSignupRepository>(),
        analyticsService: G<AnalyticsService>(),
      ),
      page: SignupPage(
        imagePicker: PolisImagePicker(),
      ),
    );
  }
}
