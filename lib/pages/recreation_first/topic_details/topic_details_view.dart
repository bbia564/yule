import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'topic_details_logic.dart';

class TopicDetailsPage extends GetView<TopicDetailsLogic> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TopicDetailsLogic>(builder: (_) {
      return Scaffold(
          appBar: AppBar(
            title: Text(controller.entity.title),
            backgroundColor: Colors.white,
            actions: [
              Image.asset(
                'assets/add.webp',
                width: 25,
                height: 25,
              ).marginOnly(right: 20).gestures(onTap: () {
                Get.toNamed('/recreationAddPage',
                        arguments: controller.entity)
                    ?.then((value) {
                  if (value != null) {
                    controller.entity = value;
                    controller.entity.list
                        .sort((a, b) => b.createTime.compareTo(a.createTime));
                    controller.update();
                  }
                });
              })
            ],
          ),
          body: SafeArea(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: controller.entity.list.isEmpty
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
                      padding: const EdgeInsets.all(15),
                      itemCount: controller.entity.list.length,
                      itemBuilder: (_, index) {
                        final entity = controller.entity.list[index];
                        return Container(
                            child: <Widget>[
                          Text(
                            entity.createTimeString,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.all(12),
                            child: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.memory(
                                  entity.image,
                                  width: 64,
                                  height: 64,
                                  fit: BoxFit.cover,
                                ),
                              ),
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
                                ),
                                const SizedBox(height: 15,),
                                Text(
                                  entity.content,
                                  style: const TextStyle(
                                      fontSize: 13, color: Colors.black54),
                                  maxLines: 200,
                                ),
                              ].toColumn(crossAxisAlignment: CrossAxisAlignment.start))
                            ].toRow(
                                crossAxisAlignment: CrossAxisAlignment.start),
                          ).decorated(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10))
                        ].toColumn(crossAxisAlignment: CrossAxisAlignment.start)).marginOnly(bottom: 10);
                      }),
            ).decorated(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
          ));
    });
  }
}
