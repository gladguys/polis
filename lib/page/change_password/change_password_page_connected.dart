import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cubits.dart';
import '../../core/repository/concrete/repositories.dart';
import '../page_connected.dart';
import 'change_password_page.dart';

class ChangePasswordPageConnected extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageConnected<ChangePasswordCubit>(
      bloc: ChangePasswordCubit(
        repository: context.repository<FirebaseChangePasswordRepository>(),
      ),
      page: ChangePasswordPage(),
    );
  }
}
