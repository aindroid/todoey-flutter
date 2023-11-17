import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:todoey_flutter/clima/services/weather_list.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../services/location.dart';
import '../services/networking.dart';
import '../utilities/constants.dart';
import 'geolocation_screen.dart';

class ClimaLoadingScreen extends StatefulWidget {
  const ClimaLoadingScreen({super.key});

  @override
  _ClimaLoadingScreenState createState() => _ClimaLoadingScreenState();
}

class _ClimaLoadingScreenState extends State<ClimaLoadingScreen> {
  final _location = LocationService();
  final _repository = WeatherRepository();

  String? _errorMessage;

  void fetchLocation() {
    _location.getLatLong((position) {
      setState(() {
        var lat = position.latitude;
        var long = position.longitude;
        print('Lat = $lat, Long = $long');
        fetchWeather(lat, long);
      });
    });
  }

  void goNext(WeatherList data) {
    Future.delayed(Duration.zero, () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GeolocationScreen(
              temperature: data.main?.temp ?? -1,
              condition: data.weather[0].id,
            ),
          ));
    });
  }

  void fetchWeather(double lat, double long) {
    // getWeather = _repository.getLondonWeatherLat();
    // getWeather.then((value) => goNext(value.main?.temp ?? -1, 200), (error) => setSt);
    // getWeather = _repository.getWeather(56.4907, 4.2026);

    var getWeather = _repository.getWeather(lat, long);

    getWeather
        .then(
          (value) => setState(() => goNext(value)),
        )
        .catchError((error) => {
              setState(() {
                _errorMessage = error.toString();
              })
            });
  }

  @override
  Widget build(BuildContext context) {
    if (_errorMessage != null) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
                child: Text(
              _errorMessage!,
              style: kErrorMessageTextStyle,
            )),
          ),
        ),
      );
    } else {
      return VisibilityDetector(
        onVisibilityChanged: (info) {
          print(info.visibleFraction);
          if (info.visibleFraction == 1.0) {
            print('fetch location');
            fetchLocation();
          }
        },
        key: const Key('loading'),
        child: Container(
          alignment: Alignment.center,
          child: const SpinKitDoubleBounce(
            size: 100.0,
            color: Colors.pink,
          ),
        ),
      );
    }
  }
}
