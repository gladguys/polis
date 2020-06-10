part of 'politic_followers_bloc.dart';

@Sealed([
  InitialPoliticFollowersState,
  GetPoliticFollowersSuccess,
  LoadingPoliticFollowers,
  GetPoliticFollowersFailed,
])
abstract class PoliticFollowersState extends Equatable {
  const PoliticFollowersState();
}

class InitialPoliticFollowersState extends PoliticFollowersState {
  @override
  List<Object> get props => [];
}

class GetPoliticFollowersSuccess extends PoliticFollowersState {
  GetPoliticFollowersSuccess({this.followers});

  final List<UsuarioSeguindoPolitico> followers;

  @override
  List<Object> get props => [followers];
}

class LoadingPoliticFollowers extends PoliticFollowersState {
  @override
  List<Object> get props => [];
}

class GetPoliticFollowersFailed extends PoliticFollowersState {
  @override
  List<Object> get props => [];
}
