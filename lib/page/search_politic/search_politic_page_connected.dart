import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../repository/concrete/repositories.dart';
import '../page_connected.dart';
import '../pages.dart';

class SearchPoliticPageConnected extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageConnected<SearchPoliticBloc>(
      bloc: SearchPoliticBloc(
        searchPoliticRepository:
            context.repository<FirebaseSearchPoliticRepository>(),
        userFollowingPoliticsRepository:
            context.repository<FirebaseUserFollowingPoliticsRepository>(),
        followRepository: context.repository<FirebaseFollowRepository>(),
      )..add(FetchPolitics(context.bloc<UserBloc>().user.userId)),
      page: SearchPoliticPage(),
    );
  }
}
