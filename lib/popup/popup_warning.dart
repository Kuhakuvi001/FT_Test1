// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/configs/config_color.dart';

class WarningPopup extends StatelessWidget {
  String message;
  WarningPopup({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            margin: EdgeInsets.only(left: 25, right: 25),
            padding: EdgeInsets.only(bottom: 15, top: 20, left: 15, right: 15),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(6)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 20,
                      height: 20,
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(3)),
                    ),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Perhatian ...",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 8)),
                          Text(
                            message,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, top: 5, bottom: 5),
                                  decoration: BoxDecoration(
                                    color: AppColor.colorblue,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    "Oke",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
