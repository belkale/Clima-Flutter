import 'location.dart';
import 'networking.dart';

const api_key = 'getyourownapikey';
const openweather_host = 'api.openweathermap.org';
const openweather_path = 'data/2.5/weather';

class WeatherModel {
  Future<dynamic> GetCityWeather(String cityName) {
    var url = Uri.https(openweather_host, openweather_path,
        {'q': cityName, 'units': 'metric', 'appid': api_key});
    NetworkHelper helper = NetworkHelper(url);
    return helper.getData();
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    print('Position: ${location.latitude} ${location.longitude}');

    var url = Uri.https(openweather_host, openweather_path, {
      'lat': location.latitude.toString(),
      'lon': location.longitude.toString(),
      'units': 'metric',
      'appid': api_key
    });
    NetworkHelper helper = NetworkHelper(url);
    return helper.getData();
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
