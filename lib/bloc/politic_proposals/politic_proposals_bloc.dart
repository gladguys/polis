import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/domain/model/models.dart';
import '../../core/repository/abstract/politic_proposals_repository.dart';

part 'politic_proposals_event.dart';
part 'politic_proposals_state.dart';

class PoliticProposalsBloc
    extends Bloc<PoliticProposalsEvent, PoliticProposalsState> {
  PoliticProposalsBloc({@required this.repository})
      : assert(repository != null);

  final PoliticProposalsRepository repository;

  @override
  PoliticProposalsState get initialState => InitialPoliticProposalsState();

  @override
  Stream<PoliticProposalsState> mapEventToState(
      PoliticProposalsEvent event) async* {
    if (event is GetPoliticProposals) {
      yield* _mapGetPoliticProposalsToState(event.politicId);
    }
  }

  Stream<PoliticProposalsState> _mapGetPoliticProposalsToState(
      String politicId) async* {
    yield LoadingPoliticProposals();

    try {
      final proposals = await repository.getPoliticProposals(politicId);
      yield GetPoliticProposalsSuccess(proposals: proposals);
    } on Exception {
      yield GetPoliticProposalsFailed();
    }
  }
}
