import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_recreation/db_recreation/db_recreation.dart';
import 'package:my_recreation/db_recreation/recreation_entity.dart';
import 'package:my_recreation/pages/recreation_first/recreation_text_field.dart';
import 'package:styled_widget/styled_widget.dart';

class RecreationFirstLogic extends GetxController {

  DBRecreation dbRecreation = Get.find<DBRecreation>();

  var list = <TopicEntity>[].obs;
  var allTopicNum = 0;

  void getData() async {
    list.value = await dbRecreation.getAllData();
    allTopicNum = list.length;
    update();
  }

  addTopic() async {
    String title = '';
    Get.dialog(AlertDialog(
      title: const Text(
        'Add topic',
        textAlign: TextAlign.center,
      ),
      content: Container(
        height: 44,
        child: RecreationTextField(
            value: title,
            maxLength: 20,
            onChange: (value) {
              title = value;
            }),
      ).decorated(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.withOpacity(0.6))),
      actions: [
        <Widget>[
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.black87),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 30,),
          TextButton(
            onPressed: () async {
              final entity = TopicEntity(id: 0, createTime: DateTime.now(), title: title, list: []);
              await dbRecreation.insertRecreation(entity);
              getData();
              Get.back();
            },
            child: const Text(
              'OK',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            ),
          )
        ].toRow(mainAxisAlignment: MainAxisAlignment.center)
      ],
    ));
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
