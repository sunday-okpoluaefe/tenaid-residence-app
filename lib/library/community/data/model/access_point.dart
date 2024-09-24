import 'package:json_annotation/json_annotation.dart';

part 'access_point.g.dart';

@JsonSerializable()
class AccessPoint {
  final String? name;
  final String? description;

  AccessPoint({required this.name, required this.description});

  factory AccessPoint.fromJson(dynamic json) => _$AccessPointFromJson(json);
  
  Map<String, dynamic> toJson() => _$AccessPointToJson(this);
}
