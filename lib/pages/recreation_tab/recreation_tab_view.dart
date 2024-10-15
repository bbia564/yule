import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_recreation/pages/recreation_first/recreation_first_logic.dart';
import 'package:my_recreation/pages/recreation_first/recreation_first_view.dart';
import 'package:my_recreation/pages/recreation_second/recreation_second_view.dart';
import 'package:my_recreation/pages/recreation_third/recreation_third_view.dart';

import '../recreation_second/recreation_second_logic.dart';
import '../recreation_third/recreation_third_logic.dart';
import 'recreation_tab_logic.dart';

class RecreationTabPage extends GetView<RecreationTabLogic> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          RecreationFirstPage(),
          RecreationSecondPage(),
          RecreationThirdPage()
        ],
      ),
      bottomNavigationBar: Obx(()=>_navReBars()),
    );
  }

  Widget _navReBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/tab0Unselect.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon:Image.asset('assets/tab0Selected.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'My data',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/tab1Unselect.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon:Image.asset('assets/tab1Selected.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Topic',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/tab2Unselect.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon:Image.asset('assets/tab2Selected.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Setting',
        ),
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        controller.currentIndex.value = index;
        controller.pageController.jumpToPage(index);
        if (index == 0) {
          RecreationFirstLogic firstLogic = Get.put(RecreationFirstLogic());
          firstLogic.getData();
        } else if (index == 1) {
          RecreationSecondLogic secondLogic = Get.put(RecreationSecondLogic());
          secondLogic.getData();
        } else if (index == 2) {
          RecreationThirdLogic thirdLogic = Get.put(RecreationThirdLogic());
          thirdLogic.getData();
        }
      },
    );
  }
}
