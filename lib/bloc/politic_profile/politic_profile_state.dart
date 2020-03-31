import 'package:equatable/equatable.dart';

import '../../model/models.dart';

abstract class PoliticProfileState extends Equatable {
  const PoliticProfileState();
}

class InitialPoliticProfileState extends PoliticProfileState {
  @override
  List<Object> get props => [];
}

class GetPoliticInfoSuccess extends PoliticProfileState {
  GetPoliticInfoSuccess({this.politic});

  final PoliticoModel politic;

  @override
  List<Object> get props => [politic];
}

class GetPoliticInfoFailed extends PoliticProfileState {
  @override
  List<Object> get props => [];
}

class LoadingPoliticInfo extends PoliticProfileState {
  @override
  List<Object> get props => [];
}
