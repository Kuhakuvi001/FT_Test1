import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/bindings/binding_activity_change.dart';
import 'package:test1/bindings/binding_activity_info.dart';
import 'package:test1/bindings/binding_root.dart';
import 'package:test1/configs/config_route.dart';
import 'package:test1/pages/page_activity_change.dart';
import 'package:test1/pages/page_activity_info.dart';
import 'package:test1/pages/page_root.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoute.root,
        getPages: [
          GetPage(
            name: AppRoute.root,
            page: () => RootPage(),
            binding: RootBinding(),
          ),
          GetPage(
            name: AppRoute.activityChange,
            page: () => ActivityChangePage(),
            binding: ActivityChangeBinding(),
          ),
          GetPage(
            name: AppRoute.activityInfo,
            page: () => ActivityInfoPage(),
            binding: ActivityInfoBinding(),
          ),
        ]);
  }
}
