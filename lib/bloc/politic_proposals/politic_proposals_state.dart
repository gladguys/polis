import 'package:equatable/equatable.dart';
import 'package:sealed_class/sealed_class.dart';

import '../../core/domain/model/models.dart';

part 'politic_proposals_state.g.dart';

@Sealed([
  InitialPoliticProposalsState,
  GetPoliticProposalsSuccess,
  LoadingPoliticProposals,
  GetPoliticProposalsFailed,
])
abstract class PoliticProposalsState extends Equatable {
  const PoliticProposalsState();
}

class InitialPoliticProposalsState extends PoliticProposalsState {
  @override
  List<Object> get props => [];
}

class GetPoliticProposalsSuccess extends PoliticProposalsState {
  GetPoliticProposalsSuccess({this.proposals});

  final List<PropostaModel> proposals;

  @override
  List<Object> get props => [proposals];
}

class LoadingPoliticProposals extends PoliticProposalsState {
  @override
  List<Object> get props => [];
}

class GetPoliticProposalsFailed extends PoliticProposalsState {
  @override
  List<Object> get props => [];
}
