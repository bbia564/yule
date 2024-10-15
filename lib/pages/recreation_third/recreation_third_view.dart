import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_recreation/pages/recreation_third/person_info_widget.dart';
import 'package:styled_widget/styled_widget.dart';

import 'recreation_third_logic.dart';

class RecreationThirdPage extends GetView<RecreationThirdLogic> {
  Widget _item(int index, BuildContext context) {
    final titles = ['Clean records', 'About app'];
    return Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        color: Colors.transparent,
        child: <Widget>[
          Text(
            titles[index],
            style: const TextStyle(fontSize: 14),
          ),
          index == 0
              ? Obx(() {
            return Text(
              'Total ${controller.allNum.value}',
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            );
          })
              : const Icon(
            Icons.keyboard_arrow_right,
            size: 20,
            color: Colors.grey,
          )
        ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween)).gestures(onTap: (){
          if(index == 0){
            controller.cleanData();
          }else if(index == 1){
            controller.aboutApp(context);
          }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Setting"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: <Widget>[
                GetBuilder<RecreationThirdLogic>(init: RecreationThirdLogic(),builder: (_) {
                  return PersonInfoWidget(allTopicNum: controller.allTopicNum,);
                }),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: <Widget>[
                    _item(0, context),
                    _item(1, context),
                  ].toColumn(
                      separator: Divider(
                        height: 15,
                        color: Colors.grey[300],
                      )),
                ).decorated(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12))
              ].toColumn(),
            ).marginAll(15)),
      ),
    );
  }
}
