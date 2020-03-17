import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../i18n/i18n.dart';
import '../../widget/centered_loading.dart';
import '../../widget/default_bottombar.dart';
import 'widget/personal_user_info.dart';
import 'widget/politics_following_quantity.dart';
import 'widget/user_activities.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DefaultBottombar(),
      body: SafeArea(
        child:
            BlocBuilder<UserProfileBloc, UserProfileState>(builder: (_, state) {
          if (state is FetchUserRelatedInfoSuccess) {
            return Container(
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  PersonalUserInfo(user: context.bloc<UserBloc>().user),
                  const SizedBox(height: 22),
                  PoliticsFollowingQuantity(politics: state.politicsFollowing),
                  const Divider(height: 22),
                  UserActivities(activities: state.userActivities),
                ],
              ),
            );
          } else if (state is LoadingFetchUserInfo) {
            return CenteredLoading();
          } else {
            return Center(
              child: Text(ERROR_FETCHING_USER_INFO),
            );
          }
        }),
      ),
    );
  }
}
