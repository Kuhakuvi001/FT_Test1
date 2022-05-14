// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures
import 'package:get/get.dart';

class ActivityProvider extends GetConnect {
  String url = "http://156.67.217.240:3500/";

  Future<Response> getActivity({value = ""}) {
    return get(url + "activities/" + value).timeout(Duration(seconds: 10));
  }

  Future<Response> addActivity(
    String activityType,
    String institution,
    String when,
    String objective,
    String remarks,
    bool insert,
    String id,
  ) {
    var body = {
      "activityType": activityType,
      "institution": institution,
      "when": when,
      "objective": objective,
      "remarks": remarks,
    };

    if (insert)
      return post(url + "activities/", body).timeout(Duration(seconds: 10));
    else
      return put(url + "activities/$id", body).timeout(Duration(seconds: 10));
  }

  Future<Response> complete(
    String result,
    String id,
  ) {
    var body = {
      "result": result,
      "id": id,
    };

    return post(url + "complete/", body).timeout(Duration(seconds: 10));
  }
}
