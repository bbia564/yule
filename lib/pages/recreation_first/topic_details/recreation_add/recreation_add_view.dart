import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_recreation/main.dart';
import 'package:my_recreation/pages/recreation_first/recreation_text_field.dart';
import 'package:styled_widget/styled_widget.dart';

import 'recreation_add_logic.dart';

class RecreationAddPage extends GetView<RecreationAddLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add"),
          backgroundColor: Colors.white,
          actions: [
            Text(
              'Commit',
              style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ).marginOnly(right: 20).gestures(onTap: () {
              controller.commit(context);
            })
          ],
        ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(15),
            child: GetBuilder<RecreationAddLogic>(builder: (_) {
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: <Widget>[
                  const Text(
                    'Theme',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 40,
                    child: RecreationTextField(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        hintText: 'Input theme',
                        value: controller.title,
                        maxLength: 20,
                        onChange: (value) {
                          controller.title = value;
                        }),
                  ).decorated(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    child: <Widget>[
                      RecreationTextField(
                          padding: EdgeInsets.zero,
                          value: controller.content,
                          hintText: 'Input content',
                          maxLines: 10,
                          maxLength: 500,
                          onChange: (value) {
                            controller.content = value;
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                                width: 80,
                                height: 80,
                                child: controller.image == null
                                    ? const Icon(
                                        Icons.add,
                                        size: 40,
                                        color: Colors.grey,
                                      )
                                    : Image.memory(
                                        controller.image!,
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ))
                            .decorated(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10))
                            .gestures(onTap: () {
                          controller.imageSelected();
                        }),
                      )
                    ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
                  ).decorated(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 44,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: <Widget>[
                      Expanded(
                          child: IgnorePointer(
                        child: RecreationTextField(
                            hintText: 'Please select topic',
                            value: controller.topicEntity?.title ?? '',
                            onChange: (value) {}),
                      )),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.keyboard_arrow_right,
                        size: 22,
                        color: Colors.grey,
                      )
                    ].toRow(),
                  )
                      .decorated(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey))
                      .gestures(onTap: () {
                    if (controller.topicEntity == null) {
                      controller.selectTopic();
                    }
                  })
                ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
              );
            }),
          )
              .decorated(
                  color: Colors.white, borderRadius: BorderRadius.circular(10))
              .marginAll(15),
        ));
  }
}
