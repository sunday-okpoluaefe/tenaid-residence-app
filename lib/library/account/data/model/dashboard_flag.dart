import 'package:json_annotation/json_annotation.dart';

part 'dashboard_flag.g.dart';

@JsonSerializable()
class DashboardFlag {
  final bool? welcome;
  final bool? joinCommunity;
  final bool? createCommunity;
  final bool? quickActions;

  DashboardFlag(
      {this.welcome = true,
      this.joinCommunity = true,
      this.createCommunity = true,
      this.quickActions = false});

  factory DashboardFlag.fromJson(dynamic json) => _$DashboardFlagFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardFlagToJson(this);
}
