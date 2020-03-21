import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/user_following_politics/bloc.dart';
import '../../../model/politico_model.dart';
import 'following_politics_list.dart';

class FollowingPoliticsSearch extends StatelessWidget {
  FollowingPoliticsSearch(this.politicos);

  final List<PoliticoModel> politicos;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 9,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: FollowingPoliticsList(politicos),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  size: 26,
                  color: Colors.black,
                ),
                hintText: 'Pesquise...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onChanged: (term) => context
                  .bloc<UserFollowingPoliticsBloc>()
                  .add(SearchPoliticsByTerm(term)),
            ),
          ),
        )
      ],
    );
  }
}
