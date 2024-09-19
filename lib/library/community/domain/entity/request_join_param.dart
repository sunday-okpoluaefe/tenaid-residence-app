class RequestJoinParam {
  final String street;
  final String community;
  final String houseNumber;
  final String apartment;
  final bool isPrimary;

  RequestJoinParam(
      {required this.street,
      required this.isPrimary,
      required this.community,
      required this.houseNumber,
      required this.apartment});
}
