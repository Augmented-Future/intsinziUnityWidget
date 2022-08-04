class UserAccount {
  int id;
  String email;
  String firstName;
  int roleId;
  int studentId;

  UserAccount({
    required this.id,
    required this.email,
    required this.firstName,
    required this.roleId,
    required this.studentId,
  });

  static UserAccount fromJson(Map<String, dynamic> json) => UserAccount(
        id: json["id"],
        email: json["email"],
        firstName: json["firstName"],
        roleId: json["roleId"],
        studentId: json["studentId"],
      );
}
