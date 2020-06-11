import 'package:flutter/material.dart';

import '../widget/error_container.dart';
import '../widget/loading.dart';

Widget mapLoadingStateToWidget(state) {
  return const Loading();
}

Widget mapErrorStateToWidget(state) {
  return const ErrorContainer();
}
