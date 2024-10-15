import 'package:get/get.dart';

import 'recreation_first_logic.dart';

class RecreationFirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RecreationFirstLogic());
  }
}
