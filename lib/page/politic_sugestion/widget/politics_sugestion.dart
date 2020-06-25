import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/blocs.dart';
import '../../../core/i18n/i18n.dart';
import 'politics_suggested_grid.dart';

class PoliticsSuggestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 16),
          Text(
            '$WELCOME, ${context.bloc<UserBloc>().user.name}!',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            POLITICS_SUGGESTION_ON_PICKED_AREA,
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: PoliticsSuggestedGrid(
              context.bloc<PoliticSuggestionBloc>().politics,
            ),
          ),
          const SizedBox(height: 4),
          RaisedButton(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            onPressed: () => context.bloc<PoliticSuggestionBloc>().add(
                  SavePoliticsToFollow(
                    user: context.bloc<UserBloc>().user,
                  ),
                ),
            child: Text(READY.toUpperCase()),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
