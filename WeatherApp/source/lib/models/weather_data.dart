import 'days.dart';
import 'stations.dart';
import 'current_conditions.dart';

class WeatherData {
  WeatherData({
    required this.queryCost,
    required this.latitude,
    required this.longitude,
    required this.resolvedAddress,
    required this.address,
    required this.timezone,
    required this.tzoffset,
    required this.description,
    required this.days,
    required this.alerts,
    // required this.stations,
    required this.currentConditions,
  });

  WeatherData.fromJson(dynamic json) {
    queryCost = json['queryCost'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    resolvedAddress = json['resolvedAddress'];
    address = json['address'];
    timezone = json['timezone'];
    tzoffset = json['tzoffset'];
    description = json['description'];
    if (json['days'] != null) {
      days = [];
      json['days'].forEach((v) {
        days.add(Days.fromJson(v));
      });
    }
    if (json['alerts'] != null) {
      alerts = [];
      json['alerts'].forEach((v) {
        alerts.add("");
      });
    }
    // stations = (json['stations'] != null
    //     ? Stations.fromJson(json['stations'])
    //     : null)!;
    // stations = '';
    currentConditions = (json['currentConditions'] != null
        ? CurrentConditions.fromJson(json['currentConditions'])
        : null)!;
  }
  late int queryCost;
  late double latitude;
  late double longitude;
  late String resolvedAddress;
  late String address;
  late String timezone;
  late double tzoffset;
  late String description;
  late List<Days> days;
  late List<dynamic> alerts;
  // late Stations stations;
  late CurrentConditions currentConditions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['queryCost'] = queryCost;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['resolvedAddress'] = resolvedAddress;
    map['address'] = address;
    map['timezone'] = timezone;
    map['tzoffset'] = tzoffset;
    map['description'] = description;
    if (days != null) {
      map['days'] = days.map((v) => v.toJson()).toList();
    }
    if (alerts != null) {
      map['alerts'] = alerts.map((v) => v.toJson()).toList();
    }
    // if (stations != null) {
    //   map['stations'] = stations.toJson();
    // }
    if (currentConditions != null) {
      map['currentConditions'] = currentConditions.toJson();
    }
    return map;
  }

  WeatherData toEntity() {
    return WeatherData(
        queryCost: queryCost,
        latitude: latitude,
        longitude: longitude,
        resolvedAddress: resolvedAddress,
        address: address,
        timezone: timezone,
        tzoffset: tzoffset,
        description: description,
        days: days,
        alerts: alerts,
        // stations: stations,
        currentConditions: currentConditions);
  }
}
