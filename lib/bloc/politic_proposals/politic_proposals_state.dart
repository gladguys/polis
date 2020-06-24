import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/domain/model/models.dart';

part 'politic_proposals_state.freezed.dart';

@freezed
abstract class PoliticProposalsState with _$PoliticProposalsState {
  factory PoliticProposalsState.initial() = InitialPoliticProposalsState;
  factory PoliticProposalsState.getPoliticProposalsSuccess(
      {List<PropostaModel> proposals}) = GetPoliticProposalsSuccess;
  factory PoliticProposalsState.getPoliticProposalsFailed() =
      GetPoliticProposalsFailed;
  factory PoliticProposalsState.loadingPoliticProposals() =
      LoadingPoliticProposals;
}
