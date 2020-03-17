import 'package:flutter/material.dart';

import '../../widget/default_bottombar.dart';

class SearchPoliticPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DefaultBottombar(),
      body: Container(
        color: Colors.blue,
      ),
    );
  }
}
