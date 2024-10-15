import 'dart:collection';

import 'package:get/get.dart';
import 'package:my_recreation/db_recreation/db_recreation.dart';
import 'package:my_recreation/db_recreation/recreation_entity.dart';

class RecreationSecondLogic extends GetxController {
  DBRecreation dbRecreation = Get.find<DBRecreation>();

  var list = <List<RecreationEntity>>[].obs;

  void getData() async {
    final topicList = await dbRecreation.getAllData();
    var hereList = <RecreationEntity>[];
    for (var element in topicList) {
      hereList.addAll(element.list);
    }
    list.value = groupByDate(hereList);
  }

  List<List<RecreationEntity>> groupByDate(List<RecreationEntity> entities) {
    Map<String, List<RecreationEntity>> groupedMap = HashMap();

    for (var entity in entities) {

      String dateKey = '${entity.createTime.year}-${entity.createTime.month.toString().padLeft(2, '0')}-${entity.createTime.day.toString().padLeft(2, '0')}';


      if (!groupedMap.containsKey(dateKey)) {
        groupedMap[dateKey] = [];
      }


      groupedMap[dateKey]!.add(entity);
    }

    List<List<RecreationEntity>> result = [];

    groupedMap.forEach((key, value) {
      value.sort((a, b) => b.createTime.compareTo(a.createTime));
      result.add(value);
    });


    result.sort((a, b) => b[0].createTime.compareTo(a[0].createTime));

    return result;
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
