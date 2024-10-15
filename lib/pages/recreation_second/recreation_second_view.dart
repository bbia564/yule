import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'recreation_second_logic.dart';

class RecreationSecondPage extends GetView<RecreationSecondLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Topic'),
      ),
      body: SafeArea(child: Obx(() {
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
                padding: const EdgeInsets.all(15),
                itemCount: controller.list.value.length,
                itemBuilder: (_, index) {
                  final entity = controller.list.value[index];
                  return Container(
                    padding: const EdgeInsets.all(12),
                    child: <Widget>[
                      <Widget>[
                        Text(
                          entity.first.createTimeString,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Visibility(
                          visible: entity.first.isToday,
                          child: Image.asset(
                            'assets/add.webp',
                            width: 25,
                            height: 25,
                          ).gestures(onTap: () {
                            Get.toNamed('/recreationAddPage')
                                ?.then((_) {
                              controller.getData();
                            });
                          }),
                        )
                      ].toRow(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween),
                      const SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: entity.length,
                          itemBuilder: (_, idx) {
                            final model = entity[idx];
                            return Container(
                              padding: const EdgeInsets.all(12),
                              child: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.memory(
                                    model.image,
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
                                    model.title,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    model.content,
                                    style: const TextStyle(
                                        fontSize: 13, color: Colors.black54),
                                    maxLines: 200,
                                  ),
                                ].toColumn(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start))
                              ].toRow(
                                  crossAxisAlignment: CrossAxisAlignment.start),
                            )
                                .decorated(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10))
                                .marginOnly(bottom: 10);
                          })
                    ].toColumn(),
                  )
                      .decorated(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12))
                      .marginOnly(bottom: 10);
                });
      })),
    );
  }
}
