import 'package:flutter/material.dart';
import 'package:todoey_flutter/clima/services/weather.dart';
import 'package:todoey_flutter/clima/services/weather_list.dart';
import 'package:todoey_flutter/components/ic_back_arrow.dart';

import '../utilities/constants.dart';

class GeolocationScreen extends StatefulWidget {
  final dynamic temperature;
  final int condition;

  GeolocationScreen({
    required this.temperature,
    required this.condition,
  });

  @override
  State<GeolocationScreen> createState() => _GeolocationScreenState();
}

class _GeolocationScreenState extends State<GeolocationScreen> {
  final weatherModal = WeatherModel();
  dynamic temperature;
  int condition = 0;

  @override
  void initState() {
    super.initState();
    temperature = widget.temperature;
    condition = widget.condition;
  }

  @override
  Widget build(BuildContext context) {
    print(temperature);
    print(condition);
    String temperatureFormatted = temperature.toStringAsFixed(1) + '°';
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 100,
        leading: const BackArrow(
          color: Colors.white,
          size: 60,
        ),
        actions: [
          Transform.rotate(
            angle: 20,
            child: IconButton(
              alignment: Alignment.topCenter,
              iconSize: 60,
              onPressed: () =>
                  {Navigator.popUntil(context, ModalRoute.withName('/clima'))},
              icon: const Icon(
                Icons.navigation,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              iconSize: 60,
              onPressed: () => {
                Navigator.pushNamed(context, '/city').then((value) => {
                      setState(() {
                        if (value is WeatherList) {
                          temperature = (value).main?.temp;
                          condition = (value).weather.first.id;
                        }
                      })
                    })
              },
              icon: const Icon(
                Icons.location_city,
              ),
            ),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/location_background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        temperatureFormatted,
                        style: kTempSmallTextStyle,
                      ),
                    ),
                    Text(
                      weatherModal.getWeatherIcon(condition),
                      style: kConditionTextStyle,
                    ),
                    // Image(
                    //   image: NetworkImage(
                    //       snapshot.data!.weather.first.getIconUrl()),
                    //   fit: BoxFit.fitHeight,
                    //   height: 200.0,
                    // )
                  ],
                ),
                Text(
                  weatherModal.getMessage(temperature.toInt()),
                  style: kMessageTextStyle,
                  textAlign: TextAlign.end,
                ),
              ]),
        ),
      ),
    );
  }
}
