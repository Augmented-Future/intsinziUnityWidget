class Book {
   Book({
   required this.id,
   required  this.author,
   required  this.ageGroup,
   required  this.cover,
   required  this.price,
   required  this.description,
   required  this.name,
   required  this.narratable,
   required  this.augmentable,
   required  this.audio,
   required  this.pdf,
   required  this.courseId,
   required  this.curriculumId,
   required  this.gradeId,
  });

  String id;
  String author;
  String ageGroup;
  String cover;
  String price;
  String description;
  String name;
  bool narratable;
  bool augmentable;
  String audio;
  String pdf;
  String courseId;
  String curriculumId;
  String gradeId;

  static Book fromJson(Map<String, dynamic> json) => Book(
        id: json["id"],
        author: json["author"],
        ageGroup: json["ageGroup"],
        cover: json["cover"],
        price: json["price"],
        description: json["description"],
        name: json["name"],
        narratable: json["narratable"],
        augmentable: json["augmentable"],
        audio: json["audio"],
        pdf: json["pdf"],
        courseId: json["courseId"],
        curriculumId: json["curriculumId"],
        gradeId: json["gradeId"],
      );
}