import 'package:json_annotation/json_annotation.dart';

part 'account_type.g.dart';

@JsonSerializable()
class AccountType {
  final String? type;
  final bool? approved;

  AccountType({required this.type, required this.approved});

  factory AccountType.fromJson(Map<String, dynamic> json) =>
      _$AccountTypeFromJson(json);

  Map<String, dynamic> toJson() => _$AccountTypeToJson(this);
}
