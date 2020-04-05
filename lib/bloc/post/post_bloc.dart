import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import './bloc.dart';
import '../../repository/abstract/post_repository.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({@required this.repository}) : assert(repository != null);

  final PostRepository repository;

  @override
  PostState get initialState => InitialPostState();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {}
}
