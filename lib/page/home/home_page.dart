import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../bloc/blocs.dart';
import '../../bloc/user/user_bloc.dart';
import '../../bloc/user/user_event.dart';
import '../../bloc/user/user_state.dart';
import '../signin/signin_page_connected.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              BlocProvider.of<UserBloc>(context).add(Logout());
            },
          )
        ],
      ),
      body: BlocListener<UserBloc, UserState>(
        listener: (_, state) {
          if (state is SignoutSucceded) {
            Get.snackbar('Logout', 'Logout');
            Get.offAll(SigninPageConnected(), (_) => false);
          }
          if (state is SignoutFailed) {
            Get.snackbar('Falha Logout', 'Falha Logout');
          }
        },
        child: Container(
          color: Colors.red,
        ),
      ),
    );
  }
}
