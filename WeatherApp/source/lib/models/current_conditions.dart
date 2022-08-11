class CurrentConditions {
  CurrentConditions({
      required this.datetime,
      required this.datetimeEpoch,
      required this.temp,
      required this.feelslike,
      required this.humidity,
      required this.dew,
      required this.precip,
      required this.precipprob,
      required this.snow,
      required this.snowdepth,
      required this.preciptype,
      required this.windgust,
      required this.windspeed,
      required this.winddir,
      required this.pressure,
      required this.visibility,
      required this.cloudcover,
      required this.solarradiation,
      required this.solarenergy,
      required this.uvindex,
      required this.conditions,
      required this.icon,
      required this.stations,
      required this.sunrise,
      required this.sunriseEpoch,
      required this.sunset,
      required this.sunsetEpoch,
      required this.moonphase,});

  CurrentConditions.fromJson(dynamic json) {
    datetime = json['datetime'];
    datetimeEpoch = json['datetimeEpoch'];
    temp = json['temp'];
    feelslike = json['feelslike'];
    humidity = json['humidity'];
    dew = json['dew'];
    precip = json['precip'];
    precipprob = json['precipprob'];
    snow = json['snow'];
    snowdepth = json['snowdepth'];
    preciptype = json['preciptype'];
    windgust = json['windgust'];
    windspeed = json['windspeed'];
    winddir = json['winddir'];
    pressure = json['pressure'];
    visibility = json['visibility'];
    cloudcover = json['cloudcover'];
    solarradiation = json['solarradiation'];
    solarenergy = json['solarenergy'] ?? 0;
    uvindex = json['uvindex'];
    conditions = json['conditions'];
    icon = json['icon'];
    stations = json['stations'] != null ? json['stations'].cast<String>() : [];
    sunrise = json['sunrise'];
    sunriseEpoch = json['sunriseEpoch'];
    sunset = json['sunset'];
    sunsetEpoch = json['sunsetEpoch'];
    moonphase = json['moonphase'];
  }
  late String datetime;
  late int datetimeEpoch;
  late double temp;
  late double feelslike;
  late double humidity;
  late double dew;
  late double precip;
  late dynamic precipprob;
  late double snow;
  late double snowdepth;
  late dynamic preciptype;
  late dynamic windgust;
  late double windspeed;
  late double winddir;
  late double pressure;
  late double visibility;
  late double cloudcover;
  late double solarradiation;
  late double solarenergy;
  late double uvindex;
  late String conditions;
  late String icon;
  late List<String> stations;
  late String sunrise;
  late int sunriseEpoch;
  late String sunset;
  late int sunsetEpoch;
  late double moonphase;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['datetime'] = datetime;
    map['datetimeEpoch'] = datetimeEpoch;
    map['temp'] = temp;
    map['feelslike'] = feelslike;
    map['humidity'] = humidity;
    map['dew'] = dew;
    map['precip'] = precip;
    map['precipprob'] = precipprob;
    map['snow'] = snow;
    map['snowdepth'] = snowdepth;
    map['preciptype'] = preciptype;
    map['windgust'] = windgust;
    map['windspeed'] = windspeed;
    map['winddir'] = winddir;
    map['pressure'] = pressure;
    map['visibility'] = visibility;
    map['cloudcover'] = cloudcover;
    map['solarradiation'] = solarradiation;
    map['solarenergy'] = solarenergy;
    map['uvindex'] = uvindex;
    map['conditions'] = conditions;
    map['icon'] = icon;
    map['stations'] = stations;
    map['sunrise'] = sunrise;
    map['sunriseEpoch'] = sunriseEpoch;
    map['sunset'] = sunset;
    map['sunsetEpoch'] = sunsetEpoch;
    map['moonphase'] = moonphase;
    return map;
  }

}