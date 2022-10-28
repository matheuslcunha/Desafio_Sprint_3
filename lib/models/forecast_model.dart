class Forecast {
  String? date;
  String? weekday;
  int? max;
  int? min;
  String? description;
  String? condition;

  Forecast();

  void fromData(buff) async {
    final data = await buff;
    date = data['date'];
    weekday = data['weekday'];
    max = data['max'];
    min = data['min'];
    description = data['description'];
    condition = data['condition'];
  }
}
