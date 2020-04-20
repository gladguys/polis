import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_router/simple_router.dart';

import '../../bloc/politic_suggestion/bloc.dart';
import '../../widget/centered_loading.dart';
import '../pages.dart';
import 'widget/politics_sugestion.dart';

class PoliticSuggestionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer(
          bloc: context.bloc<PoliticSuggestionBloc>(),
          listener: (_, state) {
            if (state is SavedSuggestedPolitics) {
              SimpleRouter.forwardAndReplace(
                CrunchingDataPage(),
              );
            }
          },
          builder: (_, state) {
            if (state is LoadingFetch || state is LoadingSaveFollowPolitics) {
              return CenteredLoading();
            } else if (state is FetchSuggestedPoliticsSuccess ||
                state is ChangedPoliticsFollowingStatus) {
              return PoliticsSuggestion();
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
