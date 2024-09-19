class PlaceDomain {
  final String? name;
  final String? address;
  final num? latitude;
  final num? longitude;
  final List<String>? types;

  PlaceDomain(
      {required this.name,
      required this.address,
      required this.latitude,
      required this.longitude,
      required this.types});
}
