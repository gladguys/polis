import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../bloc/politic_suggestion/bloc.dart';
import 'widget/politics_suggested_grid.dart';

class PoliticSuggestionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = context.bloc<PoliticSuggestionBloc>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder(
          bloc: _bloc,
          builder: (_, state) {
            if (state is LoadingFetch) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is FetchSuggestedPoliticsSuccess ||
                state is ChangedPoliticsFollowingStatus) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Bem vindo, ${context.bloc<UserBloc>().user.name}!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Sugestões de políticos em sua região',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12),
                      PoliticsSuggestedGrid(_bloc.politics),
                    ],
                  ),
                ),
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
