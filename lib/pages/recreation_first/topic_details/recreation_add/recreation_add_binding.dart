import 'package:get/get.dart';

import 'recreation_add_logic.dart';

class RecreationAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RecreationAddLogic());
  }
}
