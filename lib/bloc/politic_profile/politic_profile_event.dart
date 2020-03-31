import 'package:equatable/equatable.dart';

abstract class PoliticProfileEvent extends Equatable {
  const PoliticProfileEvent();
}

class GetPoliticInfo extends PoliticProfileEvent {
  GetPoliticInfo(this.politicId);

  final String politicId;

  @override
  List<Object> get props => [politicId];
}
