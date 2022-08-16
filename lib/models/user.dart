class UserAccount {
  int id, gradeId;
  String email, firstName, lastName, avatarUrl;

  UserAccount(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.avatarUrl,
      required this.gradeId});

  static UserAccount fromJson(Map<String, dynamic> json) => UserAccount(
      id: json["userId"],
      email: json["email"],
      firstName: json["firstName"],
      //Last name, avatar url and gradeID aren't available from API for now.
      lastName: "Ndayambaje",
      avatarUrl:
          'https://cdn.pixabay.com/photo/2016/06/06/17/05/woman-1439909_1280.jpg',
      gradeId: 1);
}
