import 'vvnb.dart';

class Stations {
  Stations({
      required this.vvnb,});

  Stations.fromJson(dynamic json) {
    vvnb = (json['VVNB'] != null ? Vvnb.fromJson(json['VVNB']) : null)!;
  }
  late Vvnb vvnb;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (vvnb != null) {
      map['VVNB'] = vvnb.toJson();
    }
    return map;
  }

}