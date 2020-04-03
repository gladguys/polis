import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../model/models.dart';

abstract class PoliticProfileState extends Equatable {
  const PoliticProfileState();
}

class InitialPoliticProfileState extends PoliticProfileState {
  @override
  List<Object> get props => [];
}

class GetPoliticInfoSuccess extends PoliticProfileState {
  GetPoliticInfoSuccess({@required this.politic, @required this.lastActivities})
      : assert(politic != null),
        assert(lastActivities != null);

  final PoliticoModel politic;
  final List<dynamic> lastActivities;

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
