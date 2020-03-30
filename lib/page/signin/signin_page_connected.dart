import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../core/service/locator.dart';
import '../../core/service/services.dart';
import '../../repository/concrete/repositories.dart';
import '../page_connected.dart';
import '../pages.dart';

class SigninPageConnected extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageConnected<SigninBloc>(
      bloc: SigninBloc(
        repository: context.repository<FirebaseSigninRepository>(),
        analyticsService: G<AnalyticsService>(),
        sharedPreferencesService: G<SharedPreferencesService>(),
      ),
      page: SigninPage(),
    );
  }
}
