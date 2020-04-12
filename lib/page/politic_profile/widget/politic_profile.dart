import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_panel/sliding_panel.dart';

import '../../../bloc/politic_profile/politic_profile_bloc.dart';
import '../../../bloc/politic_profile/politic_profile_state.dart';
import '../../../i18n/label.dart';
import '../../../widget/text_title.dart';
import '../../theme/main_theme.dart';
import 'politic_action_buttons.dart';
import 'politic_activities.dart';
import 'politic_additional_info.dart';
import 'politic_personal_info.dart';

class PoliticProfile extends StatefulWidget {
  const PoliticProfile(this.politicProfileState);

  final PoliticProfileState politicProfileState;

  @override
  State<StatefulWidget> createState() => _PoliticProfileState();
}

class _PoliticProfileState extends State<PoliticProfile> {
  PanelController _panelController;

  @override
  void initState() {
    _panelController = PanelController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlidingPanel(
      panelController: _panelController,
      parallaxSlideAmount: 0,
      isTwoStatePanel: true,
      isDraggable: true,
      decoration: PanelDecoration(
        backgroundColor: theme.scaffoldBackgroundColor,
        boxShadows: [
          BoxShadow(color: Colors.black26, blurRadius: 3),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      size: const PanelSize(
        closedHeight: 0.45,
        expandedHeight: 0.97,
      ),
      content: PanelContent(
        headerWidget: PanelHeaderWidget(
          headerContent: _buildHeader(),
          options: const PanelHeaderOptions(centerTitle: true),
          decoration: const PanelDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
        ),
        panelContent: <Widget>[
          _buildPanel(context),
        ],
        bodyContent: _buildBody(context),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
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
        TextTitle(LAST_ACTIVITIES, fontSize: 15),
        const SizedBox(height: 8),
      ],
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
        ),
        const SizedBox(height: 16),
        PoliticAdditionalInfo(politico),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildPanel(BuildContext context) {
    final bloc = context.bloc<PoliticProfileBloc>();
    final lastActivities = bloc.lastActivities;

    return PoliticActivities(lastActivities);
  }
}
