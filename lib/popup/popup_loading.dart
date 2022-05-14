// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test1/configs/config_color.dart';

class LoadingPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            margin: EdgeInsets.only(left: 25, right: 25),
            padding: EdgeInsets.only(bottom: 20, top: 20, left: 20, right: 20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(6)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: AppColor.colorgreen,
                          borderRadius: BorderRadius.circular(3)),
                    ),
                    Padding(padding: EdgeInsets.only(left: 8)),
                    Text(
                      "Mohon tunggu ...",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                LinearProgressIndicator(
                  color: AppColor.colorgreen,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
