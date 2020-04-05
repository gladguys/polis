import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();
}

class LikePost extends PostEvent {
  LikePost(this.id);

  final String id;

  @override
  List<Object> get props => [id];
}
