import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cubits.dart';
import '../../core/routing/route_names.dart';
import '../../widget/default_bottombar.dart';
import '../../widget/error_container.dart';
import '../safe_page.dart';
import 'widgets/search_politic_skeleton.dart';
import 'widgets/search_politics.dart';

class SearchPoliticPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafePage(
      child: Scaffold(
        bottomNavigationBar: DefaultBottombar(SEARCH_POLITIC_PAGE),
        body: SafeArea(
          child: BlocBuilder<SearchPoliticCubit, SearchPoliticState>(
            builder: (_, state) {
              if (state is FetchSearchPoliticsSuccess) {
                return SearchPolitics(
                  politics: state.politics,
                  partidos: context.bloc<SearchPoliticCubit>().allPartidos,
                );
              } else if (state is SearchPoliticFilterChanged) {
                return SearchPolitics(
                  politics: state.politics,
                  partidos: context.bloc<SearchPoliticCubit>().allPartidos,
                );
              } else if (state is FollowedSearchPoliticsUpdated) {
                return SearchPolitics(
                  politics: state.followedPolitics,
                  partidos: context.bloc<SearchPoliticCubit>().allPartidos,
                );
              } else if (state is InitialSearchPoliticState ||
                  state is LoadingFetchPolitics) {
                return const SearchPoliticSkeleton();
              }
              return const ErrorContainer();
            },
          ),
        ),
      ),
    );
  }
}
