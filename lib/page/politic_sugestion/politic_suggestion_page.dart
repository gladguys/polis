import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_router/simple_router.dart';

import '../../bloc/blocs.dart';
import '../../widget/loading.dart';
import '../pages.dart';
import 'widget/politics_sugestion.dart';

class PoliticSuggestionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<PoliticSuggestionBloc, PoliticSuggestionState>(
          bloc: context.bloc<PoliticSuggestionBloc>(),
          listener: (_, state) {
            if (state is SavedSuggestedPolitics) {
              SimpleRouter.forwardAndReplace(CrunchingDataPage());
            }
          },
          builder: (_, state) {
            return state.join(
              _mapLoadingToState,
              _mapFetchSuggestedPoliticsSuccessToState,
              _mapLoadingToState,
              _mapLoadingToState,
              _mapLoadingToState,
              _mapFetchSuggestedPoliticsSuccessToState,
              _mapLoadingToState,
              _mapLoadingToState,
            );
          },
        ),
      ),
    );
  }

  Widget _mapFetchSuggestedPoliticsSuccessToState(state) {
    return PoliticsSuggestion();
  }

  Widget _mapLoadingToState(state) {
    return const Loading();
  }
}
