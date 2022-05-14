import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/controllers/controller_activity.dart';
import 'package:test1/models/activity_model.dart';
import 'package:test1/popup/popup_loading.dart';
import 'package:test1/popup/popup_warning.dart';
import 'package:test1/providers/providers_activity.dart';

class ActivityInfoController extends GetxController {
  ActivityItemModel dataitem = ActivityItemModel(when: DateTime.now());

  TextEditingController inputresult = TextEditingController();
  String textresult = "";

  final cActivity = Get.find<ActivityController>();

  @override
  void onInit() {
    super.onInit();

    callapiGetData(Get.arguments);
  }

  void pickDate() async {
    DateTime? datapick = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
  }

  void callapiGetData(id) async {
    try {
      var res = await ActivityProvider().getActivity(value: id);
      dataitem = ActivityItemModel.convert(res.body);
      refresh();
    } catch (e) {
      print("ERRO :${e}");
    }
  }

  void validation() {
    textresult = inputresult.text.trim();

    if (textresult.isEmpty) {
      Get.dialog(WarningPopup(
          message:
              "Data yang anda inputkan belum lengkap, mohon periksa lagi inputan anda"));
    } else {
      callapi();
    }
  }

  void callapi() async {
    Get.dialog(LoadingPopup());
    try {
      var res =
          await ActivityProvider().complete(textresult, dataitem.id.toString());
      Get.back();
      if (res.statusCode == 200) {
        cActivity.callapiGetData();
        Get.back();
      } else {
        Get.dialog(WarningPopup(message: "Proses data gagal, coba kembali"));
      }
    } catch (e) {
      print("ERRO :${e}");
    }
  }
}
