/// coord : {"lon":-1.5744,"lat":52.3009}
/// weather : [{"id":801,"main":"Clouds","description":"few clouds","icon":"02d"}]
/// base : "stations"
/// main : {"temp":284.58,"feels_like":283.82,"temp_min":283.89,"temp_max":285.33,"pressure":997,"humidity":78,"sea_level":997,"grnd_level":991}
/// visibility : 10000
/// wind : {"speed":6.45,"deg":243,"gust":11.17}
/// clouds : {"all":12}
/// dt : 1699271367
/// sys : {"type":2,"id":2002167,"country":"GB","sunrise":1699254617,"sunset":1699288171}
/// timezone : 0
/// id : 7290540
/// name : "Warwick District"
/// cod : 200

class WeatherList {
  List<Weather> weather = [];
  Main? main;

  WeatherList({
    required this.main,
    required this.weather,
  });

  WeatherList.fromJson(dynamic json) {
    main = Main.fromJson(json['main']);
    json['weather'].forEach((v) {
      weather.add(Weather.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['main'] = main?.toJson();
    map['weather'] = weather.map((v) => v.toJson()).toList();
    return map;
  }
}

class Main {
  var temp;
  var feelsLike;
  var tempMin;
  var tempMax;
  var humidity;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
  });

  Main.fromJson(dynamic json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    humidity = json['humidity'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['temp'] = temp;
    map['feels_like'] = feelsLike;
    map['temp_min'] = tempMin;
    map['temp_max'] = tempMax;
    map['humidity'] = humidity;
    return map;
  }
}

class Weather {
  var id;
  String main = '';
  String description = '';
  String icon = '';

  Weather({
    required int id,
    required String main,
    required String description,
    required String icon,
  });

  Weather.fromJson(dynamic json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['main'] = main;
    map['description'] = description;
    map['icon'] = icon;
    return map;
  }

  String getIconUrl() => 'https://openweathermap.org/img/wn/$icon@2x.png';
}
