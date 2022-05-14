// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:test1/configs/config_color.dart';
import 'package:test1/configs/config_route.dart';
import 'package:test1/controllers/controller_activity.dart';
import 'package:get/get.dart';
import 'package:test1/models/activity_model.dart';

class ActivityPage extends StatelessWidget {
  final controller = Get.find<ActivityController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
          padding: EdgeInsets.only(right: 10, bottom: 0),
          child: FloatingActionButton(
            heroTag: "btn",
            onPressed: () {
              Get.toNamed(AppRoute.activityChange);
            },
            backgroundColor: AppColor.colorblue,
            child: Padding(
              padding: EdgeInsets.all(2),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 40,
              ),
            ),
          )),
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
        color: AppColor.colorblue,
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              "Activities",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: GetBuilder(
                  init: controller,
                  builder: (_) {
                    return Row(
                      children: <Widget>[
                        Expanded(
                            child: InkWell(
                                onTap: () {
                                  controller.changePos(0);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                      color: (controller.posMenu == 0)
                                          ? Colors.white
                                          : AppColor.colorblue,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text(
                                    "Open",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: (controller.posMenu == 0)
                                            ? Colors.black
                                            : Colors.white),
                                  ),
                                ))),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                        Expanded(
                            child: InkWell(
                                onTap: () {
                                  controller.changePos(1);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                      color: (controller.posMenu == 1)
                                          ? Colors.white
                                          : AppColor.colorblue,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text(
                                    "Complete",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: (controller.posMenu == 1)
                                            ? Colors.black
                                            : Colors.white),
                                  ),
                                ))),
                      ],
                    );
                  },
                ))
          ],
        ));
  }

  Widget layoutList() {
    return Expanded(
        child: GetBuilder(
      init: controller,
      builder: (_) {
        return ListView.builder(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            itemCount: controller.listitem.length,
            itemBuilder: (_, pos) {
              return itemList(controller.listitem[pos]);
            });
      },
    ));
  }

  Widget itemList(ActivityModel dataitem) {
    return (dataitem.complete != controller.posMenu)
        ? SizedBox()
        : Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      dataitem.listItem[0].title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: dataitem.listItem.length,
                    itemBuilder: (_, pos) {
                      return itemListitem(dataitem.listItem[pos]);
                    })
              ],
            ));
  }

  Widget itemListitem(ActivityItemModel dataitem) {
    return Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          width: 1,
          color: AppColor.colorgray.withOpacity(0.6),
        ))),
        child: InkWell(
            onTap: () {
              Get.toNamed(AppRoute.activityInfo,
                  arguments: dataitem.id.toString());
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  dataitem.time,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      color: AppColor.colorpurple,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "${dataitem.activityType} with ${dataitem.institution}",
                    style: TextStyle(color: Colors.white),
                  ),
                ))
              ],
            )));
  }

  Widget itemBottom(id, title, icon) {
    return Expanded(
        child: InkWell(
      onTap: () {
        // controller.moveactivity(id);
      },
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Column(
            children: <Widget>[
              Icon(
                icon,
                color: Colors.white,
                size: 24.0,
              ),
              Padding(padding: EdgeInsets.only(bottom: 3)),
              Text(
                title,
                style: TextStyle(color: Colors.white),
              ),
            ],
          )),
    ));
  }
}
