import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../core/service/services.dart';
import '../blocs.dart';

class DocumentBloc extends Bloc<DocumentEvent, DocumentState> {
  DocumentBloc({@required this.urlLaunchService})
      : assert(urlLaunchService != null);

  final UrlLauncherService urlLaunchService;

  @override
  DocumentState get initialState => InitialDocumentState();

  @override
  Stream<DocumentState> mapEventToState(DocumentEvent event) async* {
    yield* _mapOpenDocumentImageToState(event);
  }

  Stream<DocumentState> _mapOpenDocumentImageToState(
      OpenDocumentImage event) async* {
    try {
      urlLaunchService.launchUrl(event.url);
    } on Exception {
      yield LaunchUrlFailed();
    }
  }
}
