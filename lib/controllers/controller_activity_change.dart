import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:test1/controllers/controller_activity.dart';
import 'package:test1/models/activity_model.dart';
import 'package:test1/popup/popup_loading.dart';
import 'package:test1/popup/popup_warning.dart';
import 'package:test1/providers/providers_activity.dart';

class ActivityChangeController extends GetxController {
  TextEditingController inputinstitution = TextEditingController();
  TextEditingController inputdate = TextEditingController();
  TextEditingController inputdetail = TextEditingController();

  String? activityType;
  String? objective;
  String institution = "";
  String textdate = "";
  String textdetail = "";
  String dateapi = "";
  String id = "";

  DateTime initialDate = DateTime.now();
  TimeOfDay initialTime = TimeOfDay.now();

  final cActivity = Get.find<ActivityController>();

  String toolbar = "New Activity";
  bool insert = true;

  @override
  void onInit() {
    super.onInit();
    checkTipe();
  }

  void checkTipe() {
    var arg = Get.arguments ?? {};

    if (arg['tipe'] == "edit") {
      ActivityItemModel dataitem = arg['data'];
      insert = false;

      toolbar = "Edit Activity";

      id = dataitem.id.toString();
      activityType = dataitem.activityType;

      inputinstitution.text = dataitem.institution;
      institution = inputinstitution.text;

      initialDate = dataitem.when;
      initialTime =
          TimeOfDay(hour: dataitem.when.hour, minute: dataitem.when.minute);
      setDateTime();

      objective = dataitem.objective;

      inputdetail.text = dataitem.remarks;
      textdetail = inputdetail.text;
    }
  }

  void pickDate() async {
    DateTime? datepick = await showDatePicker(
      context: Get.context!,
      initialDate: initialDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );

    if (datepick != null) {
      TimeOfDay? timepick = await showTimePicker(
          context: Get.context!,
          initialTime: initialTime,
          builder: (_, child) {
            return MediaQuery(
              data: MediaQuery.of(Get.context!)
                  .copyWith(alwaysUse24HourFormat: true),
              child: child!,
            );
          });

      if (timepick != null) {
        initialDate = datepick;
        initialTime = timepick;

        setDateTime();
        refresh();
      }
    }
  }

  void setDateTime() {
    String date = DateFormat('dd-MMMM-yyyy').format(initialDate);
    var hour =
        (initialTime.hour < 10) ? "0${initialTime.hour}" : initialTime.hour;
    var minutes = (initialTime.minute < 10)
        ? "0${initialTime.minute}"
        : initialTime.minute;

    inputdate.text = date + " ${hour}:${minutes}";
  }

  void changeType(value) {
    activityType = value;
    refresh();
  }

  void changeObject(value) {
    objective = value;
    refresh();
  }

  void changeInstitution(value) {
    institution = value;
    refresh();
  }

  void validation() {
    String date = DateFormat('yyyy-MM-dd').format(initialDate);
    dateapi = date + " ${initialTime.hour}:${initialTime.minute}";
    textdetail = inputdetail.text.trim();

    if (activityType == null ||
        activityType!.isEmpty ||
        institution.isEmpty ||
        inputdate.text.isEmpty ||
        objective == null ||
        objective!.isEmpty ||
        textdetail.isEmpty) {
      Get.dialog(WarningPopup(
          message:
              "Data yang anda inputkan belum lengkap, mohon periksa lagi inputan anda"));
    } else {
      callapiInsert();
    }
  }

  void callapiInsert() async {
    Get.dialog(LoadingPopup());
    try {
      var res = await ActivityProvider().addActivity(activityType!, institution,
          dateapi, objective!, textdetail, insert, id);
      Get.back();
      if (res.statusCode == 200) {
        cActivity.callapiGetData();
        Get.back();
        if (!insert) Get.back();
      } else {
        Get.dialog(WarningPopup(message: "Proses data gagal, coba kembali"));
      }
    } catch (e) {
      print("ERRO :${e}");
    }
  }
}
