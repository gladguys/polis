import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../core/repository/concrete/repositories.dart';
import '../page_connected.dart';
import '../pages.dart';
import '../theme/main_theme.dart';

class PoliticSuggestionPageConnected extends StatelessWidget {
  PoliticSuggestionPageConnected(this.stateOption);

  final String stateOption;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: theme.scaffoldBackgroundColor,
      ),
    );

    return PageConnected<PoliticSuggestionBloc>(
      bloc: PoliticSuggestionBloc(
        politicSuggestionRepository:
            context.repository<FirebasePoliticSuggestionRepository>(),
        userRepository: context.repository<FirebaseUserRepository>(),
      )..add(FetchSuggestedPolitics(stateOption)),
      page: PoliticSuggestionPage(),
    );
  }
}
