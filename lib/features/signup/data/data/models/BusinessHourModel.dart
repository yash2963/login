// import '';

class BusinessHourModel {
  final Map<String, List<String>> hours;

  BusinessHourModel({required this.hours});

  Map<String, dynamic> tojson() => hours;
  factory BusinessHourModel.fromMap(Map<String, dynamic> map) {
    return BusinessHourModel(
        hours:
            map.map((key, value) => MapEntry(key, List<String>.from(value))));
  }
}
