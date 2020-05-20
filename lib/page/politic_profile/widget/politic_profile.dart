import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/blocs.dart';
import '../../../extension/media_query_extensions.dart';
import '../../../i18n/label.dart';
import '../../../widget/text_title.dart';
import '../../theme/main_theme.dart';
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
    var persistentContentHeight = context.screenHeight * 0.3;
    if (context.screenHeight < 600) {
      persistentContentHeight = context.screenHeight * 0.14;
    }

    return ExpandableBottomSheet(
      persistentContentHeight: persistentContentHeight,
      persistentHeader: _buildHeader(),
      expandableContent: _buildPanel(context),
      background: _buildBody(context),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        boxShadow: [
          const BoxShadow(
            color: Colors.black12,
            blurRadius: 2,
            offset: Offset(0, -1),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 6),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: theme.accentColor.withOpacity(.25),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 8),
          TextTitle(ACTIVITIES, fontSize: 15),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildPanel(BuildContext context) {
    final bloc = context.bloc<PoliticProfileBloc>();
    return Container(
      color: theme.scaffoldBackgroundColor,
      child: PoliticActivities(bloc.lastActivities),
    );
  }

  Widget _buildBody(BuildContext context) {
    final bloc = context.bloc<PoliticProfileBloc>();
    final politico = bloc.politico;
    final state = widget.politicProfileState;
    final isPoliticBeingFollowedByUser = state is UserFollowingPoliticChanged
        ? state.isUserFollowingPolitic
        : bloc.isPoliticBeingFollowedByUser;

    return Column(
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
        const SizedBox(height: 16),
        PoliticAdditionalInfo(politico),
        const SizedBox(height: 24),
      ],
    );
  }
}
