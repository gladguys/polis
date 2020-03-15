import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../bloc/politic_suggestion/bloc.dart';
import '../../repository/concrete/firebase/repositories.dart';
import '../page_connected.dart';
import '../pages.dart';

class PoliticSuggestionPageConnected extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
