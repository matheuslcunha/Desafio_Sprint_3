import 'package:http/http.dart' as http;
import 'dart:convert';

class FetchController {
  // A key tem usos limitados, talvez precise criar uma rsrsrs
  String key = "0864ac37";
  Future fetchWeather(String cityName) async {
    String url =
        "https://api.hgbrasil.com/weather?key=$key&city_name=${cityName}";
    var response = await http.get(Uri.parse(url));
    var json = jsonDecode(response.body);
    var weather = json['results'];

    return weather;
  }

// AINDA NÃO FUNCIONA
  Future fetchForecast() async {
    String url = "https://api.hgbrasil.com/weather?woeid=456475";
    var response = await http.get(Uri.parse(url));
    var json = jsonDecode(response.body);
    var weather = json['results'];
    var forecast = weather['forecast'];

    return forecast;
  }
}
