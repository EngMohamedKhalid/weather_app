

// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/wether_model.dart';
import 'package:weather_app/pages/home_screen.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/services/weather_services.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({Key? key,  this.updateUi}) : super(key: key);
    String? cityName ;
  final TextEditingController _controller = TextEditingController();
  late VoidCallback? updateUi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor:Provider.of<WeatherProvider>(context).weatherData==null?Colors.blue:Provider.of<WeatherProvider>(context).weatherData!.getColor(),
      appBar: AppBar(
        title: const Text(
            "Search A City",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Pacifico"
                ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Provider.of<WeatherProvider>(context).weatherData==null?Colors.blue:Provider.of<WeatherProvider>(context).weatherData!.getColor(),
                  Colors.black
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: TextField(
              onSubmitted: (val) async{
                cityName = val;
                WeatherServices services =  WeatherServices();
                WeatherModel weather= await services.getWeather(cityName: cityName!);
                Provider.of<WeatherProvider>(context,listen: false).weatherData = weather;
                Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context) => HomeScreen(
                      name: _controller.text,
                    ), )
                );
                print(weather.date);
                print(weather.weatherStateName);
                },
              controller: _controller,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 23,
                fontFamily: "Pacifico"
              ),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  )
                ),
                floatingLabelStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
                hintText: "Search here For Your City",
                hintStyle: const TextStyle(
                  fontSize: 17,
                  fontFamily: "Pacifico",
                  color: Colors.white
                ),
                label: const Text(
                    "Search",
                  style: TextStyle(
                    fontFamily: "Pacifico",
                    fontSize: 20,
                    fontWeight: FontWeight.w400
                  ),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(
                    right: 15,
                    bottom: 5
                  ),
                  child: IconButton(
                    onPressed: (){
                      searchFunction(
                        context: context,
                        val: _controller.text,
                      );
                    },
                    icon: const Icon(
                        Icons.search,
                        size: 42,
                        color: Colors.white,
                    ),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                )
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future<void> searchFunction ({required String val ,required BuildContext context }) async{
    WeatherServices services =  WeatherServices();
    WeatherModel weather= await services.getWeather(cityName: val);
    Provider.of<WeatherProvider>(context , listen: false).weatherData  = weather;
    Navigator.push(
        context,
        MaterialPageRoute(builder:(context) => HomeScreen(
          name: _controller.text,
        ), )
    );

  }
}

