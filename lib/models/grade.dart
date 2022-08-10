class Grade {
  Grade({
    required this.id,
    required this.name,
    required this.curriculumnId,
  });
  String id;
  String name;
  String curriculumnId;

  static Grade fromJson(Map<String, dynamic> json) => Grade(
        id: json["id"],
        name: json["name"],
        curriculumnId: json["curriculumnId"],
      );
}
