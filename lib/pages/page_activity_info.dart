// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test1/configs/config_color.dart';
import 'package:test1/configs/config_route.dart';
import 'package:test1/controllers/controller_activity_change.dart';
import 'package:test1/controllers/controller_activity_info.dart';
import 'package:test1/controllers/controller_activity.dart';
import 'package:get/get.dart';

class ActivityInfoPage extends StatelessWidget {
  final controller = Get.find<ActivityInfoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Expanded(
              child: Column(
            children: <Widget>[
              layoutTop(),
              layoutList(),
            ],
          )),
        ],
      )),
    );
  }

  Widget layoutTop() {
    return Container(
        width: double.infinity,
        height: 100,
        color: AppColor.colorblue,
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Stack(
          children: <Widget>[
            Positioned(
                left: 0,
                right: 0,
                child: Text(
                  "Activity Info",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
            Positioned(
                left: 10,
                child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 25,
                    )))
          ],
        ));
  }

  Widget layoutList() {
    return Expanded(
        child: SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              layoutSelect(),
              Padding(padding: EdgeInsets.only(top: 25)),
              layoutInputKet(),
              Padding(padding: EdgeInsets.only(top: 25)),
              layoutButton(),
              Padding(padding: EdgeInsets.only(top: 25)),
            ],
          )),
    ));
  }

  Widget layoutSelect() {
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.colorgrayv3,
            border: Border.all(color: AppColor.colorgrayv2)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Detail", style: TextStyle(fontWeight: FontWeight.bold)),
            Padding(padding: EdgeInsets.only(top: 15)),
            GetBuilder(
              init: controller,
              builder: (_) {
                return Text(
                  "${controller.dataitem.activityType} with ${controller.dataitem.institution} at ${controller.dataitem.datetime} to discuss about ${controller.dataitem.objective}",
                );
              },
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            InkWell(
                onTap: () {
                  Get.toNamed(AppRoute.activityChange, arguments: {
                    'tipe': 'edit',
                    'data': controller.dataitem,
                  });
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                      color: AppColor.colorblue,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Edit Activity",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ))
          ],
        ));
  }

  Widget layoutInputKet() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "What is the result ?",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.colorgrayv3,
              border: Border.all(color: AppColor.colorgrayv2)),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: TextField(
                controller: controller.inputresult,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "Customer setuju untuk membeli dalam jumlah banyak",
                  hintStyle: TextStyle(color: AppColor.colorgray),
                  border: InputBorder.none,
                ),
              )),
            ],
          ),
        )
      ],
    );
  }

  Widget layoutButton() {
    return InkWell(
        onTap: () {
          controller.validation();
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
              color: AppColor.colorgreen,
              borderRadius: BorderRadius.circular(20)),
          child: Text(
            "Complete Activity",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
