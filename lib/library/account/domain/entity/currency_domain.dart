
import 'package:copy_with_extension/copy_with_extension.dart';

part 'currency_domain.g.dart';

@CopyWith(skipFields: true)
class CurrencyDomain {
  final String name;
  final String code;
  final String symbol;

  CurrencyDomain({required this.name, required this.code, required this.symbol});
}