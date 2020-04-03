import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../enum/post_type.dart';

abstract class PostState extends Equatable {
  const PostState();
}

class InitialPostState extends PostState {
  @override
  List<Object> get props => [];
}

class FetchPostSuccess extends PostState {
  FetchPostSuccess({@required this.post, @required this.postType})
      : assert(post != null),
        assert(postType != null);

  final dynamic post;
  final PostType postType;

  @override
  List<Object> get props => [post, postType];
}

class FetchPostFailed extends PostState {
  @override
  List<Object> get props => [];
}

class LoadingPost extends PostState {
  @override
  List<Object> get props => [];
}
