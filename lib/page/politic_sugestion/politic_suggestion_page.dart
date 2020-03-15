import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../bloc/blocs.dart';
import '../../bloc/politic_suggestion/bloc.dart';
import '../../i18n/i18n.dart';
import 'widget/politics_suggested_grid.dart';

class PoliticSuggestionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = context.bloc<PoliticSuggestionBloc>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocListener(
          bloc: _bloc,
          listener: (_, state) {
            if (state is SavedSuggestedPolitics) {
              Get.snackbar('Politicos Adicionados', 'Politicos Adicionados');
            }
          },
          child: BlocBuilder(
            bloc: _bloc,
            builder: (_, state) {
              if (state is LoadingFetch || state is LoadingSaveFollowPolitics) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is FetchSuggestedPoliticsSuccess ||
                  state is ChangedPoliticsFollowingStatus) {
                return SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 14,
                        right: 14,
                        bottom: 110,
                        left: 14,
                      ),
                      child: Column(
                        children: <Widget>[
                          Text(
                            '$WELCOME, ${context.bloc<UserBloc>().user.name}!',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            POLITICS_SUGGESTION_ON_YOUR_AREA,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 12),
                          Expanded(
                            flex: 8,
                            child: PoliticsSuggestedGrid(_bloc.politics),
                          ),
                          SizedBox(height: 12),
                          Expanded(
                            flex: 1,
                            child: RaisedButton(
                              onPressed: () => _bloc.add(
                                SavePoliticsToFollow(
                                  userId: context.bloc<UserBloc>().user.userId,
                                ),
                              ),
                              child: Text(READY),
                            ),
                          ),
                          SizedBox(height: 14),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}
