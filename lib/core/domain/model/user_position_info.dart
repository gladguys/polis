import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class UserPositionInfo extends Equatable {
  UserPositionInfo({@required this.isBrazil, @required this.stateId})
      : assert(isBrazil != null),
        assert(stateId != null);

  final bool isBrazil;
  final String stateId;

  @override
  List<Object> get props => [isBrazil, stateId];
}
