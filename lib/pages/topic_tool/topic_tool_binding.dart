import 'package:get/get.dart';

import 'topic_tool_logic.dart';

class TopicToolBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
