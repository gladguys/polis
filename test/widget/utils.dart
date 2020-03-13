import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/model/user_model.dart';
import 'package:simple_router/simple_router.dart';

import '../mock.dart';

Widget connectedWidget(Widget widget) {
  SimpleRouter.setKey(Get.key);
  return BlocProvider<UserBloc>(
    create: (_) => UserBloc(
      user: UserModel(),
      repository: MockUserRepository(),
    ),
    child: MaterialApp(
      navigatorKey: Get.key,
      home: widget,
    ),
  );
}
