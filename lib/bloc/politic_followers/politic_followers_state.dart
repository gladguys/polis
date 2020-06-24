import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/domain/model/models.dart';

part 'politic_followers_state.freezed.dart';

@freezed
abstract class PoliticFollowersState with _$PoliticFollowersState {
  factory PoliticFollowersState.initial() = InitialPoliticFollowersState;
  factory PoliticFollowersState.getPoliticFollowersSuccess(
      {List<UsuarioSeguindoPolitico> followers}) = GetPoliticFollowersSuccess;
  factory PoliticFollowersState.getPoliticFollowersFailed() =
      GetPoliticFollowersFailed;
  factory PoliticFollowersState.loadingPoliticFollowers() =
      LoadingPoliticFollowers;
}
