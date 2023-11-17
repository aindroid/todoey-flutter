import 'package:flutter/material.dart';
import 'package:todoey_flutter/clima/utilities/constants.dart';

import '../services/networking.dart';
import '../services/weather_list.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String value = '';

  final _repository = WeatherRepository();

  String? _errorMessage;
  String _location = '';

  void fetchWeather() {
    var getWeather = _repository.getWeatherLocation(_location);

    getWeather
        .then(
          (value) => goNext(value),
        )
        .catchError((error) => {
              setState(() {
                _errorMessage = error.toString();
                print('ERROR: $_errorMessage');
              })
            });
  }

  void goNext(WeatherList data) {
    Navigator.pop(context, data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  iconSize: 40.0,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextFormField(
                  decoration: kTextFieldInputDecoration,
                  style: const TextStyle(color: Colors.black),
                  onChanged: (value) {
                    _location = value;
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: null,
              ),
              OutlinedButton(
                style: ButtonStyle(
                  overlayColor:
                      const MaterialStatePropertyAll<Color>(Colors.white12),
                  shape: MaterialStatePropertyAll<OutlinedBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                  side: const MaterialStatePropertyAll<BorderSide>(
                    BorderSide(
                      width: 2.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                onPressed: () {
                  if (_location.isNotEmpty) {
                    fetchWeather();
                  } else {
                    print('Location cannot be empty');
                  }
                },
                child: const Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
