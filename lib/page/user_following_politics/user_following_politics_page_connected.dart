import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../bloc/user_following_politics/bloc.dart';
import '../../bloc/user_following_politics/user_following_politics_bloc.dart';
import '../../repository/concrete/firebase/repositories.dart';
import '../page_connected.dart';
import '../pages.dart';

class UserFollowingPoliticsPageConnected extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageConnected<UserFollowingPoliticsBloc>(
      bloc: UserFollowingPoliticsBloc(
        repository: FirebaseUserFollowingPoliticsRepository(
          firestore: Firestore.instance,
        ),
      )..add(
          FetchFollowingPolitics(
            userId: context.bloc<UserBloc>().user.userId,
          ),
        ),
      page: UserFollowingPoliticsPage(),
    );
  }
}
