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
        repository: context.repository<FirebaseSearchPoliticRepository>(),
      )..add(FetchPolitics()),
      page: SearchPoliticPage(),
    );
  }
}
