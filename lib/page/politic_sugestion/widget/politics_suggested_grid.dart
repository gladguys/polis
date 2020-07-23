import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grid_delegate_ext/rendering/grid_delegate.dart';

import '../../../bloc/cubits.dart';
import '../../../core/constants.dart';
import '../../../core/domain/model/models.dart';
import '../../../widget/politic_suggested.dart';

class PoliticsSuggestedGrid extends StatelessWidget {
  PoliticsSuggestedGrid(this.politicos);

  final List<PoliticoModel> politicos;

  @override
  Widget build(BuildContext context) {
    final _bloc = context.bloc<PoliticSuggestionCubit>();
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: XSliverGridDelegate(
        crossAxisCount: 2,
        crossAxisSpacing: 6,
        mainAxisSpacing: 6,
        smallCellExtent: 205,
        bigCellExtent: 205,
      ),
      itemBuilder: (_, i) {
        return PoliticSuggested(
          politico: politicos[i],
          isFollowing: _bloc.isPoliticBeenFollowed(politicos[i]),
          onClickFollowButton: () =>
              _bloc.followOrUnfollowPolitic(politicos[i]),
        );
      },
      itemCount: min(kMaxNumberSuggestedPolitics, _bloc.politics.length),
    );
  }
}
