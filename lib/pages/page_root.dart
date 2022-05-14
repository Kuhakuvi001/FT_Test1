// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/configs/config_color.dart';
import 'package:test1/controllers/controller_root.dart';
import 'package:test1/pages/page_activity.dart';
import 'package:test1/pages/page_ongoing.dart';

class RootPage extends StatelessWidget {
  final controller = Get.find<RootController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.posMenu,
              children: [
                OngoinPage(),
                ActivityPage(),
                OngoinPage(),
                OngoinPage(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppColor.colorblue,
            selectedItemColor: AppColor.colorgreen,
            unselectedItemColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            onTap: controller.changeMenu,
            currentIndex: controller.posMenu,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today),
                label: 'My Activity',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list_alt),
                label: 'Orders',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                label: 'My Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
