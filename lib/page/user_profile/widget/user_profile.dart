import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/blocs.dart';
import '../../../bloc/user/user_bloc.dart';
import '../../../extension/media_query_extensions.dart';
import '../../../i18n/label.dart';
import '../../../model/models.dart';
import '../../../widget/text_title.dart';
import '../../theme/main_theme.dart';
import 'logout_button.dart';
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
  @override
  Widget build(BuildContext context) {
    var persistentContentHeight = context.screenHeight * 0.35;
    if (context.screenHeight < 600) {
      persistentContentHeight = context.screenHeight * 0.21;
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
          TextTitle(MY_ACTIVITIES, fontSize: 15),
          const SizedBox(height: 4),
        ],
      ),
    );
  }

  Widget _buildPanel(BuildContext context) {
    return Container(
      color: theme.scaffoldBackgroundColor,
      child: UserActions(actions: widget.userActions),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        LogoutButton(),
        PersonalUserInfo(user: context.bloc<UserBloc>().user),
        const SizedBox(height: 16),
        PoliticsFollowingQuantity(politics: widget.politicsFollowing),
      ],
    );
  }
}
