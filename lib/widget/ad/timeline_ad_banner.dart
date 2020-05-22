import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../page/theme/main_theme.dart';

class TimelineAdBanner extends StatelessWidget {
  TimelineAdBanner(this.nativeAdmobController);

  final NativeAdmobController nativeAdmobController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Divider(height: 1),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 20),
          child: Container(
            height: 64,
            child: NativeAdmob(
              loading: SpinKitThreeBounce(
                color: theme.primaryColor,
                size: 32,
              ),
              adUnitID: 'ca-app-pub-5806526425473649/3495270844',
              controller: nativeAdmobController,
              type: NativeAdmobType.banner,
            ),
          ),
        )
      ],
    );
  }
}
