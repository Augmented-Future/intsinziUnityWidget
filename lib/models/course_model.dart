class Course {
  Course({
    required this.id,
    required this.name,
    required this.gradeId,
    required this.curriculumnId,
    required this.abbreviation,
  });

  int id;
  String name;
  String gradeId;
  String curriculumnId;
  String abbreviation;

 static Course fromJson(Map<String, dynamic> json) => Course(
        id: int.parse(json["id"]),
        name: json["name"],
        gradeId: json["gradeId"],
        curriculumnId: json["curriculumnId"],
        abbreviation: json["abbreviation"],
      );
}
