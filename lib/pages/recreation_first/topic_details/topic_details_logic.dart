import 'package:get/get.dart';
import 'package:my_recreation/db_recreation/recreation_entity.dart';

class TopicDetailsLogic extends GetxController {

  TopicEntity entity = Get.arguments;
  var list = <RecreationEntity>[];

  @override
  void onInit() {
    // TODO: implement onInit
    list = entity.list;
    list.sort((a, b) {
      return b.createTime.compareTo(a.createTime);
    });
    update();
    super.onInit();
  }

}
