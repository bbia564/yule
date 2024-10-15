import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_recreation/main.dart';
import 'package:my_recreation/pages/recreation_third/person_info_widget.dart';
import 'package:styled_widget/styled_widget.dart';

import 'recreation_first_logic.dart';

class RecreationFirstPage extends GetView<RecreationFirstLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My data'),
      ),
      body: <Widget>[
        GetBuilder<RecreationFirstLogic>(init: RecreationFirstLogic(),builder: (_) {
          return PersonInfoWidget(allTopicNum: controller.allTopicNum,);
        }),
        const SizedBox(
          height: 15,
        ),
        Expanded(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: <Widget>[
                <Widget>[
                  Text(
                    'Topic type',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: primaryColor),
                  ),
                  Image.asset(
                    'assets/add.webp',
                    width: 25,
                    height: 25,
                    fit: BoxFit.cover,
                  ).gestures(onTap: () {
                    controller.addTopic();
                  })
                ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 2,
                    ).decorated(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(1)),
                    Container(
                      width: 120,
                      height: 2,
                    ).decorated(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(1))
                  ],
                ).marginSymmetric(vertical: 10),
                Expanded(child: Obx(() {
                  return controller.list.value.isEmpty
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
                      padding: EdgeInsets.zero,
                      itemCount: controller.list.value.length,
                      itemBuilder: (_, index) {
                        final entity = controller.list.value[index];
                        return Container(
                          color: Colors.transparent,
                          child: <Widget>[
                            <Widget>[
                              Container(
                                height: 6,
                                width: 6,
                              ).decorated(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(3)),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: <Widget>[
                                    Text(
                                      entity.title,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      'Total ${entity.list.length}',
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    )
                                  ].toColumn(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start))
                            ].toRow(),
                            Divider(
                              height: 15,
                              color: Colors.grey[300],
                            )
                          ].toColumn(),
                        ).gestures(onTap: () {
                          Get.toNamed('/topicDetailsPage',
                              arguments: entity)?.then((_) {
                            controller.getData();
                          });
                        });
                      });
                }))
              ].toColumn(),
            ).decorated(
                color: Colors.white, borderRadius: BorderRadius.circular(10)))
      ].toColumn().marginAll(15),
    );
  }
}
