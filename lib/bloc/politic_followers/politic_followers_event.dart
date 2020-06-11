import 'package:equatable/equatable.dart';

abstract class PoliticFollowersEvent extends Equatable {
  const PoliticFollowersEvent();
}

class GetPoliticFollowers extends PoliticFollowersEvent {
  GetPoliticFollowers(this.politicId);

  final String politicId;

  @override
  List<Object> get props => [politicId];
}
