import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageConnected<T extends Cubit<dynamic>> extends StatelessWidget {
  PageConnected({this.page, this.bloc});

  final Widget page;
  final Cubit<dynamic> bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<T>(
      create: (_) => bloc,
      child: Builder(
        builder: (__) => page,
      ),
    );
  }
}
