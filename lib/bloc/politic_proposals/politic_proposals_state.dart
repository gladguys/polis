part of 'politic_proposals_cubit.dart';

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

class GetPoliticProposalsFailed extends PoliticProposalsState {
  @override
  List<Object> get props => [];
}

class LoadingPoliticProposals extends PoliticProposalsState {
  @override
  List<Object> get props => [];
}
