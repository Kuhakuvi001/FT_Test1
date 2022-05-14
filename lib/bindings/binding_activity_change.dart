import 'package:get/get.dart';
import 'package:test1/controllers/controller_activity_change.dart';

class ActivityChangeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ActivityChangeController());
  }
}
