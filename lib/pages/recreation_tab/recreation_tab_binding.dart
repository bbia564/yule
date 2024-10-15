import 'package:get/get.dart';
import 'package:my_recreation/pages/recreation_first/recreation_first_logic.dart';
import 'package:my_recreation/pages/recreation_second/recreation_second_logic.dart';
import 'package:my_recreation/pages/recreation_third/recreation_third_logic.dart';

import 'recreation_tab_logic.dart';

class RecreationTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RecreationTabLogic());
    Get.lazyPut(() => RecreationFirstLogic());
    Get.lazyPut(() => RecreationSecondLogic());
    Get.lazyPut(() => RecreationThirdLogic());
  }
}
