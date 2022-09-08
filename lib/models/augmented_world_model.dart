class AugmentedWorldItem {
  AugmentedWorldItem({
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

  int id;
  String name;
  String courseId;
  String curriculumId;
  String gradeId;
  String creatorId;
  String chapterId;
  String image;
  String url;
  String slug;

  factory AugmentedWorldItem.fromJson(Map<String, dynamic> json) =>
      AugmentedWorldItem(
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

List<AugmentedWorldItem> augmentedWorldItems = [
  AugmentedWorldItem(
      id: 1,
      name: "Elephant",
      courseId: "1",
      curriculumId: "1",
      gradeId: "1",
      creatorId: "1",
      chapterId: "1",
      image: "https://api.intsinzi.app/uploads/image-962651397.jpeg",
      url:
          "https://community.augmented-future.com/coucouMarkerless/viewAR.php?id=1",
      slug: "elephant-1"),
  AugmentedWorldItem(
      id: 1,
      name: "Elephant",
      courseId: "1",
      curriculumId: "1",
      gradeId: "1",
      creatorId: "1",
      chapterId: "1",
      image: "https://api.intsinzi.app/uploads/image-962651397.jpeg",
      url:
          "https://community.augmented-future.com/coucouMarkerless/viewAR.php?id=1",
      slug: "elephant-1"),
];
