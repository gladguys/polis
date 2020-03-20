import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../repository/concrete/firebase/firebase_user_profile_repository.dart';
import '../page_connected.dart';
import '../pages.dart';

class UserProfilePageConnected extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageConnected<UserProfileBloc>(
      bloc: UserProfileBloc(
        repository: FirebaseUserProfileRepository(
          firestore: Firestore.instance,
        ),
      )..add(FetchUserRelatedInfo(context.bloc<UserBloc>().user.userId)),
      page: UserProfilePage(),
    );
  }
}
