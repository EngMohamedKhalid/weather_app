import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/search_screen.dart';
import 'package:weather_app/provider/weather_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: const MyApp()));

}

class MyApp extends StatelessWidget {
 const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch:Provider.of<WeatherProvider>(context).weatherData==null ?Colors.blue : Provider.of<WeatherProvider>(context).weatherData!.getColor()
      ),
      debugShowCheckedModeBanner: false,
      home:  SearchScreen(),
    );
  }
}
