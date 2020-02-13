import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageConnected<T extends Bloc<dynamic, dynamic>> extends StatelessWidget {
  PageConnected({this.page, this.bloc});

  final Widget page;
  final Bloc<dynamic, dynamic> bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<T>(
      create: (_) => bloc,
      child: page,
    );
  }
}
