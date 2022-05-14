import 'package:get/get.dart';
import 'package:test1/controllers/controller_activity_info.dart';

class ActivityInfoBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ActivityInfoController());
  }
}
