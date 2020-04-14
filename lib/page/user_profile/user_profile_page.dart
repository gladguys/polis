import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../core/routing/route_names.dart';
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
      bottomNavigationBar: DefaultBottombar(USER_PROFILE_PAGE),
      body: SafeArea(
        child: BlocBuilder<UserProfileBloc, UserProfileState>(
          builder: (_, state) {
            if (state is FetchUserRelatedInfoSuccess) {
              return Column(
                children: <Widget>[
                  const SizedBox(height: 16),
                  PersonalUserInfo(user: context.bloc<UserBloc>().user),
                  const SizedBox(height: 16),
                  PoliticsFollowingQuantity(politics: state.politicsFollowing),
                  const SizedBox(height: 24),
                  const Divider(color: Colors.grey, thickness: 0.3),
                  Expanded(
                    child: UserActions(actions: state.userActivities),
                  ),
                ],
              );
            } else if (state is LoadingFetchUserInfo) {
              return CenteredLoading();
            } else {
              return const Center(
                child: Text(ERROR_FETCHING_USER_INFO),
              );
            }
          },
        ),
      ),
    );
  }
}
