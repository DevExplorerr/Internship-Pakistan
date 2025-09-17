import 'package:hive/hive.dart';
part 'event_model.g.dart';

@HiveType(typeId: 0)
class EventModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String description;

  @HiveField(3)
  String date;

  @HiveField(4)
  String time;

  @HiveField(5)
  String location;

  @HiveField(6)
  String imageUrl;

  EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.location,
    required this.imageUrl,
  });
}
