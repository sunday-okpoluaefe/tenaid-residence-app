import 'package:json_annotation/json_annotation.dart';

part 'network_response.g.dart';

@JsonSerializable()
class NetworkResponse {
  final dynamic data;
  final String message;
  final String timestamp;
  final String path;

  NetworkResponse(this.data, this.message, this.timestamp, this.path);

  factory NetworkResponse.fromJson(Map<String, dynamic> json) =>
      _$NetworkResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkResponseToJson(this);
}
