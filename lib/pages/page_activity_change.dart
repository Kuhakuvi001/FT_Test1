// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test1/configs/config_color.dart';
import 'package:test1/controllers/controller_activity_change.dart';
import 'package:test1/controllers/controller_activity.dart';
import 'package:get/get.dart';

class ActivityChangePage extends StatelessWidget {
  final controller = Get.find<ActivityChangeController>();

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
                  controller.toolbar,
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
              layoutInput(),
              Padding(padding: EdgeInsets.only(top: 25)),
              layoutDate(),
              Padding(padding: EdgeInsets.only(top: 25)),
              layoutSelectv2(),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("What do you want to do ?",
            style: TextStyle(fontWeight: FontWeight.bold)),
        Container(
          padding: EdgeInsets.only(left: 20, right: 15),
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.colorgrayv3,
              border: Border.all(color: AppColor.colorgrayv2)),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: GetBuilder(
                init: controller,
                builder: (_) {
                  return DropdownButton<String>(
                    underline: SizedBox(),
                    iconSize: 0.0,
                    hint: Text("Meeting or Calling",
                        style: TextStyle(color: AppColor.colorgray)),
                    value: controller.activityType,
                    items:
                        <String>['Meeting', 'Phone Call'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: controller.changeType,
                  );
                },
              )),
              Icon(
                Icons.arrow_drop_down,
                color: AppColor.colorgray,
                size: 30,
              )
            ],
          ),
        )
      ],
    );
  }

  Widget layoutInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Who do you want to meet/call ?",
            style: TextStyle(fontWeight: FontWeight.bold)),
        Container(
          padding: EdgeInsets.only(left: 20, right: 15),
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.colorgrayv3,
              border: Border.all(color: AppColor.colorgrayv2)),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: TextField(
                controller: controller.inputinstitution,
                decoration: InputDecoration(
                  hintText: "CV Anugrah Jaya",
                  hintStyle: TextStyle(color: AppColor.colorgray),
                  border: InputBorder.none,
                ),
                onChanged: controller.changeInstitution,
              )),
              Icon(
                Icons.search,
                color: AppColor.colorgray,
                size: 30,
              )
            ],
          ),
        )
      ],
    );
  }

  Widget layoutDate() {
    return GetBuilder(
      init: controller,
      builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("When do you want to meet/call ${controller.institution} ?",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold)),
            Container(
                padding: EdgeInsets.only(left: 20, right: 15),
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.colorgrayv3,
                    border: Border.all(color: AppColor.colorgrayv2)),
                child: InkWell(
                  onTap: () {
                    controller.pickDate();
                  },
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: TextField(
                        controller: controller.inputdate,
                        enabled: false,
                        decoration: InputDecoration(
                          hintText: "dd-MMM-yyyy HH:mm",
                          border: InputBorder.none,
                        ),
                      )),
                      Icon(
                        Icons.date_range_outlined,
                        color: AppColor.colorgray,
                        size: 30,
                      )
                    ],
                  ),
                ))
          ],
        );
      },
    );
  }

  Widget layoutSelectv2() {
    return GetBuilder(
        init: controller,
        builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Why do you want to meet/call ${controller.institution} ?",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 15),
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.colorgrayv3,
                    border: Border.all(color: AppColor.colorgrayv2)),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: DropdownButton<String>(
                      underline: SizedBox(),
                      iconSize: 0.0,
                      hint: Text(
                        "New Order, Invoce, New Leads",
                        style: TextStyle(color: AppColor.colorgray),
                      ),
                      value: controller.objective,
                      items: <String>['New Order', 'Invoice', "New Leads"]
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: controller.changeObject,
                    )),
                    Icon(
                      Icons.arrow_drop_down,
                      color: AppColor.colorgray,
                      size: 30,
                    )
                  ],
                ),
              )
            ],
          );
        });
  }

  Widget layoutInputKet() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Could you describe it more details ?",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Container(
          padding: EdgeInsets.only(left: 20, right: 15),
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.colorgrayv3,
              border: Border.all(color: AppColor.colorgrayv2)),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: TextField(
                controller: controller.inputdetail,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "Placeholder",
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
            "Submit",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
