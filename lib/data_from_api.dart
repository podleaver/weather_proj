import 'dart:convert';

import 'package:weather_proj/dat_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static Future<DataModel> fetchCurrentWeather(

      {query, String lat = "", String lon = ""}) async {
    var url = Uri.parse(
        'https://api.weather.yandex.ru/v2/forecast?lat=59.9386&lon=30.3141&extra=true');
    final response = await http.get(url,
        headers: {'X-Yandex-API-Key': '707240b1-5b5a-48b6-9498-f9dc6a8757b9'});
    var data = await jsonDecode(response.body);
    return DataModel.fromJson(data);
  }
}
