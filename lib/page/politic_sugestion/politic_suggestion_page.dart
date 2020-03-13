import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../bloc/politic_suggestion/bloc.dart';
import '../../core/constants.dart';
import '../../widget/politic_suggested.dart';

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
              final politicos = _bloc.politics;
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
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (_, i) {
                          final isPoliticBeenFollowed =
                              _bloc.isPoliticBeenFollowed(politicos[i]);
                          return PoliticSuggested(
                            politico: politicos[i],
                            isFollowing: isPoliticBeenFollowed,
                            onClickFollowButton: () => _bloc.add(
                              isPoliticBeenFollowed
                                  ? RemovePoliticFromFollowedPolitics(
                                      politicos[i],
                                    )
                                  : AddPoliticToFollowedPolitics(politicos[i]),
                            ),
                          );
                        },
                        itemCount: kMaxNumberSuggestedPolitics,
                      )
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
