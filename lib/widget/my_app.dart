import 'package:firebase_analytics/observer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../bloc/blocs.dart';
import '../core/routing/polis_routing_observer.dart';
import '../core/service/locator.dart';
import '../core/service/services.dart';
import '../i18n/i18n.dart';
import '../model/user_model.dart';
import '../page/pages.dart';
import '../page/theme/main_theme.dart';
import '../repository/concrete/firebase/repositories.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocProvider<UserBloc>(
        create: (_) => UserBloc(
          user: UserModel(),
          repository: FirebaseUserRepository(
            firebaseAuth: FirebaseAuth.instance,
          ),
        ),
        child: MaterialApp(
          title: POLIS,
          debugShowCheckedModeBanner: false,
          theme: theme,
          navigatorKey: Get.key,
          home: InitialPage(),
          navigatorObservers: [
            FirebaseAnalyticsObserver(
                analytics: G<AnalyticsService>().analytics),
            PolisRoutingObserver(),
          ],
        ),
      );
}
