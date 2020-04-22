import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/service/services.dart';

part 'despesa_image_event.dart';
part 'despesa_image_state.dart';

class DespesaImageBloc extends Bloc<DespesaImageEvent, DespesaImageState> {
  DespesaImageBloc({@required this.urlLaunchService})
      : assert(urlLaunchService != null);

  final UrlLauncherService urlLaunchService;

  @override
  DespesaImageState get initialState => InitialDespesaImageState();

  @override
  Stream<DespesaImageState> mapEventToState(DespesaImageEvent event) async* {
    if (event is OpenDespesaImage) {
      try {
        urlLaunchService.launchUrl(event.url);
      } on Exception {
        yield LaunchUrlFailed();
      }
    }
  }
}
