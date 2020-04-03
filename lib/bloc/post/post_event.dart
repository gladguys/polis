import 'package:equatable/equatable.dart';
import 'package:polis/enum/post_type.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();
}

class FetchPost extends PostEvent {
  FetchPost({this.id, this.postType});

  final String id;
  final PostType postType;

  @override
  List<Object> get props => [id, postType];
}
