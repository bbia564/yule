import 'package:get/get.dart';

import 'recreation_third_logic.dart';

class RecreationThirdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RecreationThirdLogic());
  }
}
