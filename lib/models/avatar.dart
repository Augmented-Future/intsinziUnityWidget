class Avatar {
  int id;
  String name;
  String url;
  String gender;
  DateTime createdAt;
  DateTime updatedAt;
  Avatar({
    required this.id,
    required this.name,
    required this.url,
    required this.gender,
    required this.createdAt,
    required this.updatedAt,
  });
  static Avatar fromJson(Map<String, dynamic> json) => Avatar(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        gender: json["gender"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );
}
