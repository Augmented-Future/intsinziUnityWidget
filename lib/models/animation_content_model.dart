class AnimationsContent {
  String id;
  String image;
  String video;
  String title;
  String curriculumId;
  int gradeId;
  String courseId;
  String chapterId;
  String slug;
  String creatorId;
  String notes;
  DateTime createdAt;
  DateTime updatedAt;
  AnimationsContent({
    required this.id,
    required this.image,
    required this.video,
    required this.title,
    required this.curriculumId,
    required this.gradeId,
    required this.courseId,
    required this.chapterId,
    required this.slug,
    required this.creatorId,
    required this.notes,
    required this.createdAt,
    required this.updatedAt,
  });
  static AnimationsContent fromJson(Map<String, dynamic> json) {
    return AnimationsContent(
      id: json["id"],
      image: json["image"],
      video: json["video"],
      title: json["title"],
      curriculumId: json["curriculumId"],
      gradeId: int.parse(json["gradeId"]),
      courseId: json["courseId"],
      chapterId: json["chapterId"],
      slug: json["slug"],
      creatorId: json["creatorId"],
      notes: json["notes"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
    );
  }
}
