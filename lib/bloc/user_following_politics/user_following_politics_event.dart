import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../model/politico_model.dart';
import '../../model/user_model.dart';

abstract class UserFollowingPoliticsEvent extends Equatable {
  const UserFollowingPoliticsEvent();
}

class FetchFollowingPolitics extends UserFollowingPoliticsEvent {
  FetchFollowingPolitics({this.userId});

  final String userId;

  @override
  List<Object> get props => [userId];
}

class SearchPoliticsByTerm extends UserFollowingPoliticsEvent {
  SearchPoliticsByTerm(this.term);

  final String term;

  @override
  List<Object> get props => [term];
}

class FollowUnfollowPolitic extends UserFollowingPoliticsEvent {
  FollowUnfollowPolitic({@required this.user, @required this.politico})
      : assert(user != null),
        assert(politico != null);

  final UserModel user;
  final PoliticoModel politico;

  @override
  List<Object> get props => [user, politico];
}
