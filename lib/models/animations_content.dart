class AnimationsContent {
  int id;
  String featuredImage;
  String title;
  String curriculum;
  String grade;
  String course;
  String unit;
  String videoUrl;
  String slug;
  String contentCreator;
  String type;
  DateTime createdAt;
  DateTime updatedAt;
  AnimationsContent({
    required this.id,
    required this.featuredImage,
    required this.contentCreator,
    required this.course,
    required this.curriculum,
    required this.grade,
    required this.slug,
    required this.title,
    required this.unit,
    required this.videoUrl,
    required this.createdAt,
    required this.type,
    required this.updatedAt,
  });
  static AnimationsContent fromJson(Map<String, dynamic> json) {
    return AnimationsContent(
      id: json["id"],
      featuredImage: json["featuredImage"],
      title: json["title"],
      curriculum: json["curriculum"],
      grade: json["grade"],
      course: json["course"],
      unit: json["unit"],
      videoUrl: json["webUrl"],
      slug: json["slug"],
      contentCreator: json["contentCreator"],
      type: json["type"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
    );
  }
}
