import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:simple_router/simple_router.dart';

import '../../bloc/blocs.dart';
import '../../bloc/user/user_bloc.dart';
import '../../bloc/user/user_event.dart';
import '../../bloc/user/user_state.dart';
import '../../core/routing/route_names.dart';
import '../../core/service/services.dart';
import '../signin/signin_page_connected.dart';

class HomePage extends StatefulWidget {
  HomePage(this.adService);

  final AdService adService;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.adService.showBanner();
    super.initState();
  }

  @override
  void dispose() {
    widget.adService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              context.bloc<UserBloc>().add(Logout());
            },
          )
        ],
      ),
      body: BlocListener<UserBloc, UserState>(
        listener: (_, state) {
          if (state is SignoutSucceded) {
            Get.snackbar('Logout', 'Logout');
            SimpleRouter.forwardAndRemoveAll(
              SigninPageConnected(),
              name: SIGNIN_PAGE,
            );
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
