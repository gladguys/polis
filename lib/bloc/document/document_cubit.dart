import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/service/services.dart';

part 'document_state.dart';

class DocumentCubit extends Cubit<DocumentState> {
  DocumentCubit({@required this.urlLaunchService})
      : assert(urlLaunchService != null),
        super(InitialDocumentState());

  final UrlLauncherService urlLaunchService;

  void openDocumentImage(String url) {
    try {
      urlLaunchService.launchUrl(url);
    } on Exception {
      emit(LaunchUrlFailed());
    }
  }
}
