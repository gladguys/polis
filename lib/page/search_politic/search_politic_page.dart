import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../bloc/search_politic/bloc.dart';
import '../../core/routing/route_names.dart';
import '../../widget/centered_loading.dart';
import '../../widget/default_bottombar.dart';
import 'widgets/search_politics.dart';

class SearchPoliticPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DefaultBottombar(SEARCH_POLITIC_PAGE),
      body: BlocBuilder<SearchPoliticBloc, SearchPoliticState>(
        builder: (_, state) {
          if (state is FetchSearchPoliticsSuccess) {
            return SearchPolitics(politics: state.politics);
          } else if (state is SearchPoliticFilterChanged) {
            return SearchPolitics(politics: state.politics);
          } else if (state is FollowedSearchPoliticsUpdated) {
            return SearchPolitics(politics: state.followedPolitics);
          } else if (state is InitialSearchPoliticState ||
              state is LoadingFetchPolitics) {
            return CenteredLoading();
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
