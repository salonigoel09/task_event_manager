import 'package:hive/hive.dart';
part 'event_model.g.dart';



@HiveType(typeId: 1)

class EventModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  DateTime date;

  @HiveField(2)
  String time;

  EventModel({
    required this.title,
    required this.date,
    required this.time,
  });
}