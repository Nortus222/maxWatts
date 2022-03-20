import 'package:hive/hive.dart';

part 'hiveModel.g.dart';

@HiveType(typeId: 10)
class Workout extends HiveObject {
  @HiveField(0)
  DateTime? date;

  @HiveField(1)
  List<int>? _set;

  @HiveField(2)
  int max = 0;

  @HiveField(3)
  int min = 0;

  @HiveField(4)
  int sum = 0;

  @HiveField(5)
  double avg = 0.0;

  @HiveField(6)
  double plank = 0.0;

  Workout() {
    date = DateTime.now();
    _set = [];
  }

  void append(int record) {
    _set!.add(record);
  }

  List<int> getSet() {
    return _set!;
  }
}
