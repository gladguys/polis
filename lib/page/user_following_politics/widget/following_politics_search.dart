import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../bloc/cubits.dart';
import '../../../core/domain/model/models.dart';
import '../../../core/i18n/label.dart';
import '../../../core/keys.dart';
import '../../../widget/field_rounded.dart';
import 'following_politics_list.dart';

class FollowingPoliticsSearch extends StatelessWidget {
  FollowingPoliticsSearch(this.politicos);

  final List<PoliticoModel> politicos;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: FollowingPoliticsList(politicos),
        ),
        Divider(height: 1, color: Colors.grey[300]),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: FieldRounded(
            key: searchTextfieldKey,
            hintText: SEARCH_HERE,
            width: 300,
            iconPrefix: FontAwesomeIcons.search,
            onChanged: (term) => context
                .bloc<UserFollowingPoliticsCubit>()
                .searchPoliticsByTerm(term),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
