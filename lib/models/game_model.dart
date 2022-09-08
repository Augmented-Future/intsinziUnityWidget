class Game {
  Game({
    required this.id,
    required this.name,
    required this.courseId,
    required this.curriculumId,
    required this.gradeId,
    required this.creatorId,
    required this.chapterId,
    required this.image,
    required this.url,
    required this.slug,
  });

  String id;
  String name;
  String courseId;
  String curriculumId;
  String gradeId;
  String creatorId;
  String chapterId;
  String image;
  String url;
  String slug;

  static Game fromJson(Map<String, dynamic> json) => Game(
        id: json["id"],
        name: json["name"],
        courseId: json["courseId"],
        curriculumId: json["curriculumId"],
        gradeId: json["gradeId"],
        creatorId: json["creatorId"],
        chapterId: json["chapterId"],
        image: json["image"],
        url: json["url"],
        slug: json["slug"],
      );
}
