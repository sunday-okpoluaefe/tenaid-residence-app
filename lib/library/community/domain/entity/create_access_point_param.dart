class CreateAccessPointParam {
  final String name;
  final String description;
  final String password;
  final String community;

  CreateAccessPointParam(
      {required this.community,
      required this.name,
      required this.description,
      required this.password});
}
