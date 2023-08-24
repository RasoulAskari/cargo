class UserModel extends Equatable {
  final String name;
  final String email;
  final String password;
  final String role;
  final String permission;

  UserModel(
      {required this.name,
      required this.email,
      required this.password,
      required this.role,
      required this.permission});
}
