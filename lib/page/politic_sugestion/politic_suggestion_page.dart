import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_router/simple_router.dart';

import '../../bloc/blocs.dart';
import '../../widget/error_container.dart';
import '../../widget/loading.dart';
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
              return Loading();
            } else if (state is FetchSuggestedPoliticsSuccess ||
                state is ChangedPoliticsFollowingStatus) {
              return PoliticsSuggestion();
            } else {
              return ErrorContainer();
            }
          },
        ),
      ),
    );
  }
}
