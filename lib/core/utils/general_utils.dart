import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';

bool isPostLikedForUser(BuildContext context, {String postId}) {
  final user = context.bloc<UserBloc>().user;
  return user.userLikes != null ? (user.userLikes[postId] ?? false) : false;
}

bool isPostUnlikedForUser(BuildContext context, {String postId}) {
  final user = context.bloc<UserBloc>().user;
  return user.userUnlikes != null ? (user.userUnlikes[postId] ?? false) : false;
}
