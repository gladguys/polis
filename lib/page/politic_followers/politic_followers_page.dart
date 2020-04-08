import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/politic_followers/bloc.dart';
import '../../core/routing/route_names.dart';
import '../../i18n/i18n.dart';
import '../../model/usuario_seguindo_politico_model.dart';
import '../../widget/card_base.dart';
import '../../widget/centered_loading.dart';
import '../../widget/default_bottombar.dart';
import '../../widget/photo.dart';
import '../../widget/text_title.dart';

class PoliticFollowersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DefaultBottombar(SEARCH_POLITIC_PAGE),
      body: SafeArea(
        child: BlocBuilder<PoliticFollowersBloc, PoliticFollowersState>(
          builder: (_, state) {
            if (state is GetPoliticFollowersSuccess) {
              return _buildList(state.followers);
            } else {
              return CenteredLoading();
            }
          },
        ),
      ),
    );
  }

  Widget _buildList(List<UsuarioSeguindoPolitico> followers) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        TextTitle(FOLLOWERS),
        Expanded(
          child: ListView.builder(
            itemBuilder: (_, i) => _buildListTile(followers[i]),
            itemCount: followers.length,
          ),
        ),
      ],
    );
  }

  Widget _buildListTile(UsuarioSeguindoPolitico follower) {
    return CardBase(
      slotLeft: Photo(url: follower.photoUrl, boxFit: BoxFit.cover),
      slotCenter: Text(follower.name),
      crossAxisAlignment: CrossAxisAlignment.center,
    );
  }
}
