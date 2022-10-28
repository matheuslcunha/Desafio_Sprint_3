import 'package:desafio_sprint_3/models/forecast_model.dart';

class Weather {
  String? date;
  String? time;
  int? temp;
  String? description;
  String? city;
  String? sunrise;
  String? sunset;
  String? condition_slug;
  List<Forecast>? forecast;

  Weather();

  void fromData(buff) async {
    final data = await buff;
    date = data['date'];
    time = data['time'];
    temp = data['temp'];
    description = data['description'];
    city = data['city'];
    sunrise = data['sunrise'];
    sunset = data['sunset'];
    condition_slug = data['condition_slug'];
    forecast = data['forecast'];
  }
}
