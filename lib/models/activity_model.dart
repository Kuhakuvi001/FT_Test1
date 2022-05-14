import 'package:intl/intl.dart';

class ActivityModel {
  int complete;
  List<ActivityItemModel> listItem;

  ActivityModel({
    required this.complete,
    required this.listItem,
  });

  static List<ActivityModel> convert(List list) {
    List<ActivityModel> listmodelOpen = [];
    List<ActivityModel> listmodelComp = [];

    var tempO = "";
    var tempC = "";

    var iO = -1;
    var iC = -1;

    for (var item in list) {
      ActivityItemModel itemModel = ActivityItemModel.convert(item);

      if (itemModel.complete == 0) {
        if (tempO != itemModel.title || listmodelOpen.isEmpty) {
          listmodelOpen.add(ActivityModel(
              complete: itemModel.complete, listItem: [itemModel]));
          iO++;
        } else {
          listmodelOpen[iO].listItem.add(itemModel);
        }

        tempO = itemModel.title;
      } else {
        if (tempC != itemModel.title || listmodelComp.isEmpty) {
          listmodelComp.add(ActivityModel(
              complete: itemModel.complete, listItem: [itemModel]));
          iC++;
        } else {
          listmodelComp[iC].listItem.add(itemModel);
        }

        tempC = itemModel.title;
      }
    }

    return listmodelOpen + listmodelComp;
  }
}

class ActivityItemModel {
  int id;
  String activityType;
  String institution;
  DateTime when;
  String objective;
  String remarks;
  String time;
  String title;
  String datetime;
  int complete;

  ActivityItemModel({
    this.id = 0,
    this.activityType = "",
    this.institution = "",
    required this.when,
    this.objective = "",
    this.remarks = "",
    this.time = "",
    this.title = "",
    this.datetime = "",
    this.complete = 0,
  });

  static ActivityItemModel convert(item) {
    DateTime dt = DateTime.parse(item['when']);
    String title = DateFormat('EEEE, dd MMMM yyyy').format(dt);
    String time = DateFormat('HH:mm').format(dt);
    String datetime = DateFormat('dd-MMMM-yyyy HH:mm').format(dt);

    return ActivityItemModel(
      id: item['id'] ?? 0,
      activityType: item['activityType'],
      institution: item['institution'],
      when: dt,
      objective: item['objective'],
      remarks: item['remarks'],
      time: time,
      title: title,
      datetime: datetime,
      complete: item['complete'],
    );
  }
}
