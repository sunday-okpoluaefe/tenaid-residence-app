class UpdateProfileInfoParam {
  final String firstName;
  final String lastName;
  final String photo;
  final String phone;
  final String country;
  final String dob;

  UpdateProfileInfoParam(
      {required this.firstName,
      required this.lastName,
      required this.photo,
      required this.phone,
      required this.country,
      required this.dob});
}
