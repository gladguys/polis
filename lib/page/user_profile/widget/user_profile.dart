import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_router/simple_router.dart';
import 'package:sliding_panel/sliding_panel.dart';

import '../../../bloc/blocs.dart';
import '../../../bloc/user/user_bloc.dart';
import '../../../core/routing/route_names.dart';
import '../../../i18n/label.dart';
import '../../../model/models.dart';
import '../../../widget/text_title.dart';
import '../../initial/initial_page.dart';
import '../../theme/main_theme.dart';
import 'personal_user_info.dart';
import 'politics_following_quantity.dart';
import 'user_activities.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({this.politicsFollowing, this.userActions});

  final List<PoliticoModel> politicsFollowing;
  final List<AcaoUsuarioModel> userActions;

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
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
        TextTitle(MY_ACTIVITIES, fontSize: 15),
        const SizedBox(height: 4),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        _buildLogoutButton(),
        PersonalUserInfo(user: context.bloc<UserBloc>().user),
        const SizedBox(height: 16),
        PoliticsFollowingQuantity(politics: widget.politicsFollowing),
      ],
    );
  }

  Widget _buildLogoutButton() {
    final userBloc = context.bloc<UserBloc>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          key: const ValueKey('logout-button'),
          height: 30,
          child: OutlineButton.icon(
            padding: EdgeInsets.zero,
            label: Text(LOGOUT.toUpperCase()),
            icon: FaIcon(
              FontAwesomeIcons.signOutAlt,
              size: 18,
            ),
            color: Colors.red,
            textColor: Colors.red,
            highlightedBorderColor: Colors.red,
            onPressed: () {
              userBloc.add(Logout());
              SimpleRouter.forwardAndRemoveAll(
                InitialPage(),
                name: INITIAL_PAGE,
              );
            },
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildPanel(BuildContext context) {
    return UserActions(actions: widget.userActions);
  }
}
