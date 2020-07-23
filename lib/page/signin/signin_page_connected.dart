import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cubits.dart';
import '../../core/repository/concrete/repositories.dart';
import '../../core/service/locator.dart';
import '../../core/service/services.dart';
import '../page_connected.dart';
import '../pages.dart';

class SigninPageConnected extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageConnected<SigninCubit>(
      bloc: SigninCubit(
        repository: context.repository<FirebaseSigninRepository>(),
        analyticsService: G<AnalyticsService>(),
        sharedPreferencesService: G<SharedPreferencesService>(),
        messageService: G<MessageService>(),
      ),
      page: SigninPage(),
    );
  }
}
