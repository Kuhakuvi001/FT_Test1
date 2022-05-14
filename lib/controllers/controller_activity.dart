import 'package:get/get.dart';
import 'package:test1/models/activity_model.dart';
import 'package:test1/providers/providers_activity.dart';

class ActivityController extends GetxController {
  List<ActivityModel> listitem = [];

  int posMenu = 0;

  @override
  void onInit() {
    super.onInit();

    callapiGetData();
  }

  void callapiGetData() async {
    try {
      print("hehehe");
      var res = await ActivityProvider().getActivity();
      listitem = ActivityModel.convert(res.body['activities']);
      refresh();
    } catch (e) {
      print("ERRO :${e}");
    }
  }

  void changePos(pos) {
    posMenu = pos;
    refresh();
  }
}
