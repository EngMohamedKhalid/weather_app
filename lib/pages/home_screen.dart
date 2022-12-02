import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/wether_model.dart';
import 'package:weather_app/pages/search_screen.dart';
import 'package:weather_app/provider/weather_provider.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
WeatherModel? weatherData ;
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
     backgroundColor: weatherData!.getColor(),
      appBar: AppBar(
        title: const Text(
          "Weather",
          style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w500,
              fontFamily: "Pacifico"
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => SearchScreen())
                  )
                );
              },
              icon:const Icon(
                Icons.search,
                size: 42,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: weatherData  == null ?
        const Center(
          child: Padding(
            padding: EdgeInsets.only(
              left: 30,
              right: 30
            ),
            child: Text(
                  "there no weather 😞 start \n \t\t\t\t\t searching now 🔍",
                style: TextStyle(
                  wordSpacing: 2,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
              ),
          ),
        )
          :
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 1,),
           Text(
            widget.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35
            ),
          ),
          const SizedBox(height: 10,),
          Text(
            "Time ${weatherData!.date.hour}:${weatherData!.date.minute}",
            style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 20
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(weatherData!.getImage()),
                Text(
                    "Temp:${weatherData!.temp} ْc",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                  ),
                ),
                Column(
                  children: [
                    Text(
                "maxTemp:${weatherData!.maxTemp.toInt()} ْc",
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "minTemp:${weatherData!.minTemp.toInt()} ْc",
                      style:const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Text(
            weatherData!.weatherStateName,
            style:const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28
            ),
          ),
          const Spacer(flex: 3,)
        ],
      ),
    );
  }
}
