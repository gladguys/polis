import 'package:equatable/equatable.dart';

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
