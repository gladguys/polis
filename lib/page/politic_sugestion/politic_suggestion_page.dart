import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../bloc/politic_suggestion/bloc.dart';
import 'widget/politics_sugestion.dart';

class PoliticSuggestionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = context.bloc<PoliticSuggestionBloc>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocConsumer(
          bloc: _bloc,
          listener: (_, state) {
            if (state is SavedSuggestedPolitics) {
              Get.snackbar('Politicos Adicionados', 'Politicos Adicionados');
            }
          },
          builder: (_, state) {
            if (state is LoadingFetch || state is LoadingSaveFollowPolitics) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is FetchSuggestedPoliticsSuccess ||
                state is ChangedPoliticsFollowingStatus) {
              return PoliticsSuggestion();
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
