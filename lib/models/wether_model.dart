import 'dart:ui';

import 'package:flutter/material.dart';

class WeatherModel{
  final DateTime date ;
  final double temp ;
  final double maxTemp ;
  final double minTemp ;
  final String weatherStateName ;

  WeatherModel(
      {
         required this.date,
         required this.temp,
         required this.maxTemp,
         required this.minTemp,
         required this.weatherStateName,
      }
      );

     //مهم جدا  هيكون ثابت فيما بعد
  // factory WeatherModel.fromJson(dynamic data){
  //   var jsonData = data["forecast"]["forecastday"][(0)]["day"];
  //   return WeatherModel(
  //     date: data["location"]["localtime"],
  //     temp: jsonData["avgtemp_c"],
  //     maxTemp: jsonData["maxtemp_c"],
  //     minTemp: jsonData["mintemp_c"],
  //     weatherStateName: jsonData["condition"]["text"],
  //   );
  //
  // }
  /////////////////////////////////

@override
  String toString() {
    return" temp = $temp , date = $date";
  }

  String getImage(){
   if(weatherStateName == "Snow"){
     return "assets/images/snow.png";
   }
   else
     if(weatherStateName=="Heavy Cloud"){
     return "assets/images/cloudy.png";
   }
     else
     if(weatherStateName=="Thunderstorm"){
       return "assets/images/thunderstorm.png";
     }
     else
     if(weatherStateName=="clear"){
       return "assets/images/clear.png";
     }
     else
     if(weatherStateName=="Heavy Rain" || weatherStateName == "Patchy rain possible"||weatherStateName == "Moderate rain"){
       return "assets/images/rainy.png";
     }
   return "assets/images/clear.png";
  }
  MaterialColor getColor(){
    if(weatherStateName == "Snow"){
      return Colors.orange;
    }
    else
    if(weatherStateName=="Heavy Cloud"){
      return Colors.grey ;
    }
    else
    if(weatherStateName=="Thunderstorm"){
      return Colors.lightBlue;
    }
    else
    if(weatherStateName=="clear" ){
      return Colors.orange;
    }
    else
    if(weatherStateName=="Heavy Rain" || weatherStateName == "Patchy rain possible"||weatherStateName == "Moderate rain"){
      return Colors.blueGrey ;
    }
    return Colors.yellow;
  }
}