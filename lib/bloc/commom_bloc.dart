import 'package:flutter/material.dart';

import '../widget/error_container.dart';
import '../widget/loading.dart';

Widget mapLoadingStateToWidget(dynamic state) {
  return const Loading();
}

Widget mapLoadingToWidget() {
  return const Loading();
}

Widget mapErrorStateToWidget(dynamic state) {
  return const ErrorContainer();
}

Widget mapErrorToWidget() {
  return const ErrorContainer();
}
