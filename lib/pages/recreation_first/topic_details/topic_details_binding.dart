import 'package:get/get.dart';

import 'topic_details_logic.dart';

class TopicDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TopicDetailsLogic());
  }
}
