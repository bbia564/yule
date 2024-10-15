import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_recreation/db_recreation/db_recreation.dart';
import 'package:my_recreation/db_recreation/recreation_entity.dart';
import 'package:styled_widget/styled_widget.dart';

class RecreationAddLogic extends GetxController {
  DBRecreation dbRecreation = Get.find<DBRecreation>();

  String title = '';
  String content = '';
  Uint8List? image;
  var list = <TopicEntity>[];

  TopicEntity? topicEntity = Get.arguments;

  void getData() async {
    list = await dbRecreation.getAllData();
  }

  void imageSelected() async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final imageBytes = await pickedFile.readAsBytes();
        image = imageBytes;
        update();
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'Please check album permissions or select a new image');
      return;
    }
  }

  void selectTopic() {
    Get.bottomSheet(Container(
      padding: const EdgeInsets.all(12),
      height: 400,
      child: list.isEmpty
          ? Center(
              child: <Widget>[
                Image.asset(
                  'assets/noData.webp',
                  width: 39,
                  height: 39,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'No data',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ].toColumn(mainAxisAlignment: MainAxisAlignment.center),
            )
          : ListView.builder(
              itemCount: list.length,
              itemBuilder: (_, index) {
                final entity = list[index];
                return Container(
                  color: Colors.transparent,
                  child: <Widget>[
                    Text(
                      entity.title,
                      style: const TextStyle(fontSize: 14),
                    ),
                    Divider(
                      height: 15,
                      color: Colors.grey[300],
                    )
                  ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
                ).gestures(onTap: () {
                  Get.back();
                  topicEntity = entity;
                  update();
                });
              }),
    ).decorated(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12), topRight: Radius.circular(12))));
  }

  void commit(BuildContext context) async {
    if (title.isEmpty || content.isEmpty) {
      Fluttertoast.showToast(msg: 'Please fill in the title and content');
      return;
    }
    if (image == null) {
      Fluttertoast.showToast(msg: 'Please select an image');
      return;
    }
    if (topicEntity == null) {
      Fluttertoast.showToast(msg: 'Please select a topic');
      return;
    }
    FocusScope.of(context).requestFocus(FocusNode());
    final recreationEntity = RecreationEntity(
        createTime: DateTime.now(),
        title: title,
        content: content,
        image: image!);
    var currentList = topicEntity?.list ?? [];
    currentList.add(recreationEntity);
    topicEntity?.list = currentList;
    await dbRecreation.updateRecreation(topicEntity!);
    Fluttertoast.showToast(msg: 'Success');
    Get.back(result: topicEntity);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    update();
    super.onInit();
  }
}
