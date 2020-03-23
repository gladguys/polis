import 'package:flutter/material.dart';

class UserPositionInfo {
  UserPositionInfo({@required this.isBrazil, @required this.stateId})
      : assert(isBrazil != null),
        assert(stateId != null);

  final bool isBrazil;
  final String stateId;
}
