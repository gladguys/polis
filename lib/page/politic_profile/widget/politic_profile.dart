import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/blocs.dart';
import '../../../core/i18n/label.dart';
import '../../../widget/text_title.dart';
import 'politic_action_buttons.dart';
import 'politic_activities.dart';
import 'politic_additional_info.dart';
import 'politic_personal_info.dart';

class PoliticProfile extends StatefulWidget {
  const PoliticProfile(this.politicProfileState, {this.onUnfollowPolitic});

  final PoliticProfileState politicProfileState;
  final VoidCallback onUnfollowPolitic;

  @override
  State<StatefulWidget> createState() => _PoliticProfileState();
}

class _PoliticProfileState extends State<PoliticProfile> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          flexibleSpace: _buildHeader(context),
          expandedHeight: 260,
          leading: Container(),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            _buildBody(),
          ]),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    final bloc = context.bloc<PoliticProfileBloc>();
    final politico = bloc.politico;
    final state = widget.politicProfileState;
    final isPoliticBeingFollowedByUser = state is UserFollowingPoliticChanged
        ? state.isUserFollowingPolitic
        : bloc.isPoliticBeingFollowedByUser;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 16),
          PoliticPersonalInfo(politico),
          const SizedBox(height: 16),
          PoliticActionButtons(
            politico: politico,
            isBeingFollowedByUser: isPoliticBeingFollowedByUser,
            onUnfollowPolitic: widget.onUnfollowPolitic,
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    final bloc = context.bloc<PoliticProfileBloc>();
    final politico = bloc.politico;
    return Column(
      children: <Widget>[
        const SizedBox(height: 16),
        PoliticAdditionalInfo(politico),
        const SizedBox(height: 24),
        const SizedBox(height: 8),
        TextTitle(ACTIVITIES),
        const SizedBox(height: 8),
        PoliticActivities(bloc.lastActivities),
      ],
    );
  }
}
