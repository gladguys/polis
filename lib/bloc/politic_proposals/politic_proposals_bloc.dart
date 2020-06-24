import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../core/repository/abstract/politic_proposals_repository.dart';
import 'politic_proposals_event.dart';
import 'politic_proposals_state.dart';

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
    yield* event.map(
      getPoliticProposals: _mapGetPoliticProposalsToState,
    );
  }

  Stream<PoliticProposalsState> _mapGetPoliticProposalsToState(
      PoliticProposalsEvent event) async* {
    yield LoadingPoliticProposals();

    try {
      final proposals = await repository.getPoliticProposals(event.politicId);
      yield GetPoliticProposalsSuccess(proposals: proposals);
    } on Exception {
      yield GetPoliticProposalsFailed();
    }
  }
}
