import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/model/user_model.dart';
import 'package:simple_router/simple_router.dart';

import '../mock.dart';

Widget connectedWidget(Widget widget) {
  SimpleRouter.setKey(GlobalKey<NavigatorState>());
  return BlocProvider<UserBloc>(
    create: (_) => UserBloc(
      user: UserModel(
        userId: '1',
      ),
      repository: MockUserRepository(),
    ),
    child: MaterialApp(
      navigatorKey: SimpleRouter.getKey(),
      home: widget,
    ),
  );
}
