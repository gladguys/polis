import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../core/service/services.dart';
import 'document_event.dart';
import 'document_state.dart';

class DocumentBloc extends Bloc<DocumentEvent, DocumentState> {
  DocumentBloc({@required this.urlLaunchService})
      : assert(urlLaunchService != null);

  final UrlLauncherService urlLaunchService;

  @override
  DocumentState get initialState => DocumentState.initial();

  @override
  Stream<DocumentState> mapEventToState(DocumentEvent event) async* {
    yield* event.map(
      openDocumentImage: _mapOpenDocumentImageToState,
    );
  }

  Stream<DocumentState> _mapOpenDocumentImageToState(
      DocumentEvent event) async* {
    try {
      urlLaunchService.launchUrl(event.url);
    } on Exception {
      yield DocumentState.launchUrlFailed();
    }
  }
}
