import 'package:flutter/material.dart';

import '../../core/routing/route_names.dart';
import '../../widget/default_bottombar.dart';

class TimelinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DefaultBottombar(TIMELINE_PAGE),
      body: Container(
        color: Colors.green,
      ),
    );
  }
}
