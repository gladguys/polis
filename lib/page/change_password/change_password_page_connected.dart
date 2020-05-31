import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/change_password/change_password_bloc.dart';
import '../../core/repository/concrete/repositories.dart';
import '../page_connected.dart';
import 'change_password_page.dart';

class ChangePasswordPageConnected extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageConnected<ChangePasswordBloc>(
      bloc: ChangePasswordBloc(
        repository: context.repository<FirebaseChangePasswordRepository>(),
      ),
      page: ChangePasswordPage(),
    );
  }
}
