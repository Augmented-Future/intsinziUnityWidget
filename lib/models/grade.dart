class Grade {
  Grade({
    required this.id,
    required this.name,
    required this.curriculumnId,
  });
  int id;
  String name;
  int curriculumnId;

  static Grade fromJson(Map<String, dynamic> json) => Grade(
        id: int.parse(json["id"]),
        name: json["name"],
        curriculumnId: int.parse(json["curriculumnId"]),
      );
}

Grade noGrade = Grade(id: 0, name: "No Grade", curriculumnId: 0);
