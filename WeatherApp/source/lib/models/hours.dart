class Hours {
  Hours({
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
      required this.severerisk,
      required this.conditions,
      required this.icon,
      required this.stations,
      required this.source,});

  Hours.fromJson(dynamic json) {
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
    preciptype = json['preciptype'] != null ? json['preciptype'].cast<String>() : [];
    windgust = json['windgust'];
    windspeed = json['windspeed'];
    winddir = json['winddir'];
    pressure = json['pressure'];
    visibility = json['visibility'];
    cloudcover = json['cloudcover'];
    solarradiation = json['solarradiation'];
    solarenergy = json['solarenergy'];
    uvindex = json['uvindex'];
    severerisk = json['severerisk'];
    conditions = json['conditions'];
    icon = json['icon'];
    stations = json['stations'] != null ? json['stations'].cast<String>() : [];
    source = json['source'];
  }
  late String datetime;
  late int datetimeEpoch;
  late double temp;
  late double feelslike;
  late double humidity;
  late double dew;
  late double precip;
  late double precipprob;
  late double snow;
  late double snowdepth;
  late List<String> preciptype;
  late double windgust;
  late double windspeed;
  late double winddir;
  late double pressure;
  late double visibility;
  late double cloudcover;
  late double solarradiation;
  late dynamic solarenergy;
  late double uvindex;
  late double severerisk;
  late String conditions;
  late String icon;
  late List<String> stations;
  late String source;

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
    map['severerisk'] = severerisk;
    map['conditions'] = conditions;
    map['icon'] = icon;
    map['stations'] = stations;
    map['source'] = source;
    return map;
  }

}