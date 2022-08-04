class UserAccount {
  int id;
  String email;
  String firstName;
  String lastName;
  int roleId;
  int studentId;

  UserAccount({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.roleId,
    required this.studentId,
  });

  static UserAccount fromJson(Map<String, dynamic> json) => UserAccount(
        id: json["id"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        roleId: json["roleId"],
        studentId: json["studentId"],
      );
}
