import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_router/simple_router.dart';

import '../../bloc/blocs.dart';
import '../../bloc/commom_bloc.dart';
import '../pages.dart';
import 'widget/politics_sugestion.dart';

class PoliticSuggestionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<PoliticSuggestionBloc, PoliticSuggestionState>(
          listener: (_, state) {
            state.maybeWhen(
              savedSuggestedPolitics: () =>
                  SimpleRouter.forwardAndReplace(CrunchingDataPage()),
              orElse: () => {},
            );
          },
          builder: (_, state) => state.maybeMap(
            fetchSuggestedPoliticsSuccess: _mapStateToWidget,
            changedPoliticsFollowingStatus: _mapStateToWidget,
            loadingFetch: mapLoadingStateToWidget,
            loadingSaveFollowPolitics: mapLoadingStateToWidget,
            orElse: mapErrorToWidget,
          ),
        ),
      ),
    );
  }

  Widget _mapStateToWidget(state) {
    return const PoliticsSuggestion();
  }
}
