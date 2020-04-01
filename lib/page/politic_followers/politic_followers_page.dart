import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../bloc/politic_followers/bloc.dart';
import '../../core/routing/route_names.dart';
import '../../widget/centered_loading.dart';
import '../../widget/default_bottombar.dart';

class PoliticFollowersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DefaultBottombar(SEARCH_POLITIC_PAGE),
      body: BlocBuilder<PoliticFollowersBloc, PoliticFollowersState>(
        builder: (_, state) {
          if (state is GetPoliticFollowersSuccess) {
            final followers = state.followers;
            return ListView.builder(
              itemBuilder: (_, i) => ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: followers[i].photoUrl != null
                      ? FancyShimmerImage(
                          imageUrl: followers[i].photoUrl,
                          width: 40,
                          height: 40,
                        )
                      : const FaIcon(
                          FontAwesomeIcons.solidUserCircle,
                          size: 40,
                        ),
                ),
                title: Text(followers[i].name),
              ),
              itemCount: followers.length,
            );
          } else {
            return CenteredLoading();
          }
        },
      ),
    );
  }
}
