import 'package:get/get.dart';
import 'package:simple_router/simple_router.dart';

void configRouting() {
  SimpleRouter.setKey(Get.key);

  SimpleRouter.onBeforePush = (widget) =>
      print('[SimpleRouter] Navigation: to page ${widget.toString()}');

  SimpleRouter.onAfterPush = (widget) =>
      print('[SimpleRouter] Navigation: out of page ${widget.toString()}');
}
