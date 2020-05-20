import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';

import '../../extension/extensions.dart';

class TimelineAdBanner extends StatelessWidget {
  TimelineAdBanner(this.nativeAdmobController);

  final NativeAdmobController nativeAdmobController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Container(
            height: 60,
            color: context.baseBackgroundColor,
            child: NativeAdmob(
              loading: Container(),
              adUnitID: 'ca-app-pub-5806526425473649/3495270844',
              controller: nativeAdmobController,
              type: NativeAdmobType.banner,
            ),
          ),
        ),
      ],
    );
  }
}
