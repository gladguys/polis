import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../bloc/commom_bloc.dart';
import '../../core/routing/route_names.dart';
import '../../widget/default_bottombar.dart';
import 'widgets/search_politic_skeleton.dart';
import 'widgets/search_politics.dart';

class SearchPoliticPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DefaultBottombar(SEARCH_POLITIC_PAGE),
      body: SafeArea(
        child: BlocBuilder<SearchPoliticBloc, SearchPoliticState>(
          builder: (_, state) => state.map(
            fetchSearchPoliticsSuccess: (state) {
              return SearchPolitics(
                politics: state.politics,
                partidos: context.bloc<SearchPoliticBloc>().allPartidos,
              );
            },
            searchPoliticFilterChanged: (state) {
              return SearchPolitics(
                politics: state.politics,
                partidos: context.bloc<SearchPoliticBloc>().allPartidos,
              );
            },
            followedSearchPoliticsUpdated: (state) {
              return SearchPolitics(
                politics: state.followedPolitics,
                partidos: context.bloc<SearchPoliticBloc>().allPartidos,
              );
            },
            initial: (state) => const SearchPoliticSkeleton(),
            loadingFetchPolitics: (state) => const SearchPoliticSkeleton(),
            fetchSearchPoliticsFailed: mapErrorStateToWidget,
            followUnfollowPoliticsFailed: mapErrorStateToWidget,
          ),
        ),
      ),
    );
  }
}
