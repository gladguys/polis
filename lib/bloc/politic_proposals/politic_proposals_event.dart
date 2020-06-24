import 'package:freezed_annotation/freezed_annotation.dart';

part 'politic_proposals_event.freezed.dart';

@freezed
abstract class PoliticProposalsEvent with _$PoliticProposalsEvent {
  factory PoliticProposalsEvent.getPoliticProposals(String politicId) =
      GetPoliticProposals;
}
