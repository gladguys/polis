import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cubits.dart';
import '../../core/domain/model/models.dart';
import '../../core/repository/concrete/repositories.dart';
import '../../core/service/locator.dart';
import '../../core/service/services.dart';
import 'my_app.dart';

class MyAppConnected extends StatefulWidget {
  MyAppConnected({@required this.sharedPreferencesService})
      : assert(sharedPreferencesService != null);

  final SharedPreferencesService sharedPreferencesService;

  @override
  _MyAppConnectedState createState() => _MyAppConnectedState();
}

class _MyAppConnectedState extends State<MyAppConnected> {
  UserModel user;
  bool isUserLogged;

  SharedPreferencesService get sharedPreferencesService =>
      widget.sharedPreferencesService;

  @override
  void initState() {
    user = sharedPreferencesService.getUser();
    isUserLogged = sharedPreferencesService.isUserLogged();

    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (_) => UserCubit(
        user: user ?? UserModel(),
        repository: context.repository<FirebaseUserRepository>(),
        analyticsService: G<AnalyticsService>(),
        sharedPreferencesService: G<SharedPreferencesService>(),
      ),
      child: MyApp(
        user: user,
        isUserLogged: isUserLogged,
      ),
    );
  }
}
