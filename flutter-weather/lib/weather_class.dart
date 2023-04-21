class Weather {
  double temperature;
  int pressure;
  int humidity;
  int cloudCover;

  Weather({
    required this.temperature,
    required this.pressure,
    required this.humidity,
    required this.cloudCover,
  });

  Weather.fromJson(Map json)
      : temperature = json['main']['temp'] - 273,
        pressure = json['main']['pressure'],
        humidity = json['main']['humidity'],
        cloudCover = json['clouds']['all'];

  Weather.empty()
      : temperature = 0,
        pressure = 0,
        humidity = 0,
        cloudCover = 0;
}
