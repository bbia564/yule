import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_recreation/db_recreation/db_recreation.dart';
import 'package:my_recreation/pages/recreation_first/recreation_first_binding.dart';
import 'package:my_recreation/pages/recreation_first/recreation_first_view.dart';
import 'package:my_recreation/pages/recreation_first/topic_details/recreation_add/recreation_add_binding.dart';
import 'package:my_recreation/pages/recreation_first/topic_details/recreation_add/recreation_add_view.dart';
import 'package:my_recreation/pages/recreation_first/topic_details/topic_details_binding.dart';
import 'package:my_recreation/pages/recreation_first/topic_details/topic_details_view.dart';
import 'package:my_recreation/pages/recreation_second/recreation_second_binding.dart';
import 'package:my_recreation/pages/recreation_second/recreation_second_view.dart';
import 'package:my_recreation/pages/recreation_tab/recreation_tab_binding.dart';
import 'package:my_recreation/pages/recreation_tab/recreation_tab_view.dart';
import 'package:my_recreation/pages/recreation_third/recreation_third_binding.dart';
import 'package:my_recreation/pages/recreation_third/recreation_third_view.dart';
import 'package:my_recreation/pages/topic_tool/topic_tool_binding.dart';
import 'package:my_recreation/pages/topic_tool/topic_tool_view.dart';

import 'db_recreation/db_ads.dart';

Color primaryColor = const Color(0xff02b934);
Color bgColor = const Color(0xfff2f2f2);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Get.putAsync(() => DBRecreation().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Datas,
      initialRoute: '/',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}

List<GetPage<dynamic>> Datas = [
  GetPage(name: '/', page: () => const TopicToolView(), binding: TopicToolBinding()),
  GetPage(name: '/recreationTabPage', page: () => RecreationTabPage(), binding: RecreationTabBinding()),
  GetPage(name: '/recreationTopicTool', page: () => const DbAds()),
  GetPage(name: '/recreationFirstPage', page: () => RecreationFirstPage(), binding: RecreationFirstBinding()),
  GetPage(name: '/recreationSecondPage', page: () => RecreationSecondPage(), binding: RecreationSecondBinding()),
  GetPage(name: '/recreationThirdPage', page: () => RecreationThirdPage(), binding: RecreationThirdBinding()),
  GetPage(name: '/topicDetailsPage', page: () => TopicDetailsPage(), binding: TopicDetailsBinding()),
  GetPage(name: '/recreationAddPage', page: () => RecreationAddPage(),binding: RecreationAddBinding())
];