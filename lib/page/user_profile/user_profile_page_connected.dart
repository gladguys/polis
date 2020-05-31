import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../core/repository/concrete/repositories.dart';
import '../page_connected.dart';
import '../pages.dart';

class UserProfilePageConnected extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageConnected<UserProfileBloc>(
      bloc: UserProfileBloc(
        repository: context.repository<FirebaseUserProfileRepository>(),
      )..add(FetchUserRelatedInfo(context.bloc<UserBloc>().user.userId)),
      page: UserProfilePage(),
    );
  }
}
