import 'package:equatable/equatable.dart';

abstract class PoliticProposalsEvent extends Equatable {
  const PoliticProposalsEvent();
}

class GetPoliticProposals extends PoliticProposalsEvent {
  GetPoliticProposals(this.politicId);

  final String politicId;

  @override
  List<Object> get props => [politicId];
}
