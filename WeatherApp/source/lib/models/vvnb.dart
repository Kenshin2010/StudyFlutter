class Vvnb {
  Vvnb({
      required this.distance,
      required this.latitude,
      required this.longitude,
      required this.useCount,
      required this.id,
      required this.name,
      required this.quality,
      required this.contribution,});

  Vvnb.fromJson(dynamic json) {
    distance = json['distance'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    useCount = json['useCount'];
    id = json['id'];
    name = json['name'];
    quality = json['quality'];
    contribution = json['contribution'];
  }
  late double distance;
  late double latitude;
  late double longitude;
  late int useCount;
  late String id;
  late String name;
  late int quality;
  late double contribution;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['distance'] = distance;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['useCount'] = useCount;
    map['id'] = id;
    map['name'] = name;
    map['quality'] = quality;
    map['contribution'] = contribution;
    return map;
  }

}