import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';

import '../services/networking.dart';

const api_key = 'getyourownapikey';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    print('Position: ${location.latitude} ${location.longitude}');

    var url = Uri.https('api.openweathermap.org', 'data/2.5/weather', {
      'lat': location.latitude.toString(),
      'lon': location.longitude.toString(),
      'appid': api_key
    });
    NetworkHelper helper = NetworkHelper(url);
    var weatherData = await helper.getData();
    double temp = weatherData['main']['temp'];
    int condition = weatherData['weather'][0]['id'];
    String city = weatherData['name'];
    print('Temp: $temp Condition: $condition City: $city');
  }

  Widget build(BuildContext context) {
    return Scaffold();
  }
}
