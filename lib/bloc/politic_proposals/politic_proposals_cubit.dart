import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/domain/model/models.dart';
import '../../core/repository/abstract/politic_proposals_repository.dart';

part 'politic_proposals_state.dart';

class PoliticProposalsCubit extends Cubit<PoliticProposalsState> {
  PoliticProposalsCubit({@required this.repository})
      : assert(repository != null),
        super(InitialPoliticProposalsState());

  final PoliticProposalsRepository repository;

  void getPoliticProposals(String politicId) async {
    emit(LoadingPoliticProposals());

    try {
      final proposals = await repository.getPoliticProposals(politicId);
      emit(GetPoliticProposalsSuccess(proposals: proposals));
    } on Exception {
      emit(GetPoliticProposalsFailed());
    }
  }
}
