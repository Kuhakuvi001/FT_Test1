import 'package:get/get.dart';
import 'package:test1/controllers/controller_activity.dart';
import 'package:test1/controllers/controller_root.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RootController());
    Get.put(ActivityController());
  }
}
