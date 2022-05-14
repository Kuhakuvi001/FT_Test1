import 'package:get/get.dart';
import 'package:test1/models/activity_model.dart';

class RootController extends GetxController {
  List<ActivityModel> listitem = [];

  int posMenu = 1;

  @override
  void onInit() {
    super.onInit();
  }

  void changeMenu(pos) {
    posMenu = pos;
    refresh();
  }
}
