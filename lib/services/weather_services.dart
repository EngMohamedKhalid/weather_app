import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/wether_model.dart';
class WeatherServices  {
  String apiKey = "7128763f60f0404a83d182943220212";
  String baseUrl = "http://api.weatherapi.com/v1";
  Future <WeatherModel> getWeather({required String cityName}) async{
    //Uri uri = Uri.parse("$baseUrl/current.json?key=$apiKey&q=$cityName/days=1&aqi=no&alerts=no");
    Uri uri =  Uri.parse("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7&aqi=no&alerts=no"
    );
    http.Response response = await http.get(uri);
    Map<String , dynamic> data = jsonDecode(response.body);

    Map<String, dynamic> jsonData = data["forecast"]["forecastday"][0]["day"];

    WeatherModel weatherModel =  WeatherModel(
          date: DateTime.parse(data["current"]["last_updated"]),
          temp: jsonData["avgtemp_c"],
          maxTemp: jsonData["maxtemp_c"],
          minTemp: jsonData["mintemp_c"],
          weatherStateName: jsonData["condition"]["text"],
    );
    return  weatherModel;
    //Alexandria
  }
}