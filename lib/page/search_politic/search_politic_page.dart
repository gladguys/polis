import 'package:flutter/material.dart';

import '../../core/routing/route_names.dart';
import '../../widget/default_bottombar.dart';

class SearchPoliticPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DefaultBottombar(SEARCH_POLITIC_PAGE),
      body: Container(
        color: Colors.blue,
      ),
    );
  }
}
