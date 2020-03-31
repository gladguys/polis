import 'package:equatable/equatable.dart';

import '../../model/models.dart';
import '../../model/usuario_seguindo_politico_model.dart';

abstract class PoliticProfileState extends Equatable {
  const PoliticProfileState();
}

class InitialPoliticProfileState extends PoliticProfileState {
  @override
  List<Object> get props => [];
}

class GetPoliticInfoSuccess extends PoliticProfileState {
  GetPoliticInfoSuccess({this.politic, this.usersFollowing});

  final PoliticoModel politic;
  final List<UsuarioSeguindoPolitico> usersFollowing;

  @override
  List<Object> get props => [politic, usersFollowing];
}

class GetPoliticInfoFailed extends PoliticProfileState {
  @override
  List<Object> get props => [];
}

class LoadingPoliticInfo extends PoliticProfileState {
  @override
  List<Object> get props => [];
}
