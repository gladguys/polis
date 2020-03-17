import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/blocs.dart';
import '../../../i18n/i18n.dart';
import 'politics_suggested_grid.dart';

class PoliticsSuggestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 14,
            right: 14,
            bottom: 110,
            left: 14,
          ),
          child: Column(
            children: <Widget>[
              Text(
                '$WELCOME, ${context.bloc<UserBloc>().user.name}!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                POLITICS_SUGGESTION_ON_YOUR_AREA,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                flex: 8,
                child: PoliticsSuggestedGrid(
                    context.bloc<PoliticSuggestionBloc>().politics),
              ),
              const SizedBox(height: 12),
              Expanded(
                flex: 1,
                child: RaisedButton(
                  onPressed: () => context.bloc<PoliticSuggestionBloc>().add(
                        SavePoliticsToFollow(
                          userId: context.bloc<UserBloc>().user.userId,
                        ),
                      ),
                  child: const Text(READY),
                ),
              ),
              const SizedBox(height: 14),
            ],
          ),
        ),
      ),
    );
  }
}
