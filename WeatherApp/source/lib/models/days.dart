import 'hours.dart';

class Days {
  Days({
      required this.datetime,
      required this.datetimeEpoch,
      required this.tempmax,
      required this.tempmin,
      required this.temp,
      required this.feelslikemax,
      required this.feelslikemin,
      required this.feelslike,
      required this.dew,
      required this.humidity,
      required this.precip,
      required this.precipprob,
      required this.precipcover,
      required this.preciptype,
      required this.snow,
      required this.snowdepth,
      required this.windgust,
      required this.windspeed,
      required this.winddir,
      required this.pressure,
      required this.cloudcover,
      required this.visibility,
      required this.solarradiation,
      required this.solarenergy,
      required this.uvindex,
      required this.severerisk,
      required this.sunrise,
      required this.sunriseEpoch,
      required this.sunset,
      required this.sunsetEpoch,
      required this.moonphase,
      required this.conditions,
      required this.description,
      required this.icon,
      required this.stations,
      required this.source,
      required this.hours,});

  Days.fromJson(dynamic json) {
    datetime = json['datetime'];
    datetimeEpoch = json['datetimeEpoch'];
    tempmax = json['tempmax'];
    tempmin = json['tempmin'];
    temp = json['temp'];
    feelslikemax = json['feelslikemax'];
    feelslikemin = json['feelslikemin'];
    feelslike = json['feelslike'];
    dew = json['dew'];
    humidity = json['humidity'];
    precip = json['precip'];
    precipprob = json['precipprob'];
    precipcover = json['precipcover'];
    preciptype = json['preciptype'] != null ? json['preciptype'].cast<String>() : [];
    snow = json['snow'];
    snowdepth = json['snowdepth'];
    windgust = json['windgust'];
    windspeed = json['windspeed'];
    winddir = json['winddir'];
    pressure = json['pressure'];
    cloudcover = json['cloudcover'];
    visibility = json['visibility'];
    solarradiation = json['solarradiation'];
    solarenergy = json['solarenergy'];
    uvindex = json['uvindex'];
    severerisk = json['severerisk'];
    sunrise = json['sunrise'];
    sunriseEpoch = json['sunriseEpoch'];
    sunset = json['sunset'];
    sunsetEpoch = json['sunsetEpoch'];
    moonphase = json['moonphase'];
    conditions = json['conditions'];
    description = json['description'];
    icon = json['icon'];
    stations = json['stations'] != null ? json['stations'].cast<String>() : [];
    source = json['source'];
    if (json['hours'] != null) {
      hours = [];
      json['hours'].forEach((v) {
        hours.add(Hours.fromJson(v));
      });
    }
  }
  late String datetime;
  late int datetimeEpoch;
  late double tempmax;
  late double tempmin;
  late double temp;
  late double feelslikemax;
  late double feelslikemin;
  late double feelslike;
  late double dew;
  late double humidity;
  late double precip;
  late double precipprob;
  late double precipcover;
  late List<String> preciptype;
  late double snow;
  late double snowdepth;
  late double windgust;
  late double windspeed;
  late double winddir;
  late double pressure;
  late double cloudcover;
  late double visibility;
  late double solarradiation;
  late double solarenergy;
  late double uvindex;
  late double severerisk;
  late String sunrise;
  late int sunriseEpoch;
  late String sunset;
  late int sunsetEpoch;
  late double moonphase;
  late String conditions;
  late String description;
  late String icon;
  late List<String> stations;
  late String source;
  late List<Hours> hours;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['datetime'] = datetime;
    map['datetimeEpoch'] = datetimeEpoch;
    map['tempmax'] = tempmax;
    map['tempmin'] = tempmin;
    map['temp'] = temp;
    map['feelslikemax'] = feelslikemax;
    map['feelslikemin'] = feelslikemin;
    map['feelslike'] = feelslike;
    map['dew'] = dew;
    map['humidity'] = humidity;
    map['precip'] = precip;
    map['precipprob'] = precipprob;
    map['precipcover'] = precipcover;
    map['preciptype'] = preciptype;
    map['snow'] = snow;
    map['snowdepth'] = snowdepth;
    map['windgust'] = windgust;
    map['windspeed'] = windspeed;
    map['winddir'] = winddir;
    map['pressure'] = pressure;
    map['cloudcover'] = cloudcover;
    map['visibility'] = visibility;
    map['solarradiation'] = solarradiation;
    map['solarenergy'] = solarenergy;
    map['uvindex'] = uvindex;
    map['severerisk'] = severerisk;
    map['sunrise'] = sunrise;
    map['sunriseEpoch'] = sunriseEpoch;
    map['sunset'] = sunset;
    map['sunsetEpoch'] = sunsetEpoch;
    map['moonphase'] = moonphase;
    map['conditions'] = conditions;
    map['description'] = description;
    map['icon'] = icon;
    map['stations'] = stations;
    map['source'] = source;
    if (hours != null) {
      map['hours'] = hours.map((v) => v.toJson()).toList();
    }
    return map;
  }

}