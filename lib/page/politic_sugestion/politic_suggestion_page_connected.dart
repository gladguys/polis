import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../bloc/politic_suggestion/bloc.dart';
import '../../repository/concrete/firebase/repositories.dart';
import '../page_connected.dart';
import '../pages.dart';
import '../theme/main_theme.dart';

class PoliticSuggestionPageConnected extends StatelessWidget {    
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: theme.scaffoldBackgroundColor,
      ),
    );

    return PageConnected<PoliticSuggestionBloc>(
      bloc: PoliticSuggestionBloc(
        repository: FirebasePoliticSuggestionRepository(
          firestore: Firestore.instance,
        ),
      )..add(FetchSuggestedPolitics()),
      page: PoliticSuggestionPage(),
    );
  }
}
