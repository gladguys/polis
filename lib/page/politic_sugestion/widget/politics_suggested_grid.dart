import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/politic_suggestion/bloc.dart';
import '../../../core/constants.dart';
import '../../../model/politico_model.dart';
import '../../../widget/politic_suggested.dart';

class PoliticsSuggestedGrid extends StatelessWidget {
  PoliticsSuggestedGrid(this.politicos);

  final List<PoliticoModel> politicos;

  @override
  Widget build(BuildContext context) {
    final _bloc = context.bloc<PoliticSuggestionBloc>();
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (_, i) {
        final isPoliticBeenFollowed = _bloc.isPoliticBeenFollowed(politicos[i]);
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
      itemCount: min(kMaxNumberSuggestedPolitics, _bloc.politics.length),
    );
  }
}
