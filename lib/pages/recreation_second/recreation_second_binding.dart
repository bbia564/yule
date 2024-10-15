import 'package:get/get.dart';

import 'recreation_second_logic.dart';

class RecreationSecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RecreationSecondLogic());
  }
}
