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
    sum += record;

    if (_set!.length == 1) {
      max = record;
      min = record;
    } else if (record > max) {
      max = record;
    } else if (record < min) {
      min = record;
    }

    avg = sum / _set!.length.toDouble();
    plank = max * 0.9;
  }

  void remove(int index) {
    int num = _set![index];
    _set!.removeAt(index);

    if (_set!.isEmpty) {
      reset();
      return;
    }

    sum -= num;

    if (num == max) {
      int tmpMax = _set![0];
      for (int i = 1; i < _set!.length; i++) {
        if (_set![i] > tmpMax) {
          tmpMax = _set![i];
        }
      }
      max = tmpMax;
    } else if (num == min) {
      int tmpMin = _set![0];
      for (int i = 1; i < _set!.length; i++) {
        if (_set![i] < tmpMin) {
          tmpMin = _set![i];
        }
      }
      min = tmpMin;
    }

    avg = sum / _set!.length.toDouble();
    plank = max * 0.9;
  }

  void reset() {
    max = 0;
    min = 0;
    sum = 0;
    plank = 0.0;
    avg = 0.0;
  }

  int length() {
    return _set!.length;
  }

  List<int> getSet() {
    return _set!;
  }
}
