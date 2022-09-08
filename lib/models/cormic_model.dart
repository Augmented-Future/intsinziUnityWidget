class Cormic {
  Cormic(
      {required this.id,
      required this.cover,
      required this.name,
      required this.pdf,
      required this.courseId,
      required this.curriculumId,
      required this.gradeId,
      required this.slug,
      required this.price,
      required this.createdAt});

  String id;
  String cover;
  String name;
  String pdf;
  String courseId;
  String curriculumId;
  String gradeId;
  String slug;
  double price;
  DateTime createdAt;

  Cormic fromJson(Map<String, dynamic> json) => Cormic(
      id: json["id"],
      cover: json["cover"],
      name: json["name"],
      pdf: json["pdf"],
      courseId: json["courseId"],
      curriculumId: json["curriculumId"],
      gradeId: json["gradeId"],
      slug: json["slug"],
      createdAt: DateTime.parse(json["createdAt"]),
      price: double.parse(json["price"]));
}

List<Cormic> cormics = [
  Cormic(
      id: "12",
      cover: "https://thumbs.dreamstime.com/b/print-146985740.jpg",
      name: "Mathematics",
      pdf: "https://api.intsinzi.app/uploads/pdf-826742921.pdf",
      courseId: "1",
      curriculumId: "1",
      gradeId: "1",
      slug: "math-24",
      createdAt: DateTime.now(),
      price: 500),
  Cormic(
      id: "12",
      cover: "https://thumbs.dreamstime.com/b/print-146985740.jpg",
      name: "Mathematics",
      pdf: "https://api.intsinzi.app/uploads/pdf-826742921.pdf",
      courseId: "1",
      curriculumId: "1",
      gradeId: "1",
      slug: "math-24",
      createdAt: DateTime.now(),
      price: 700),
  Cormic(
      id: "12",
      cover: "https://thumbs.dreamstime.com/b/print-146985740.jpg",
      name: "Mathematics",
      pdf: "https://api.intsinzi.app/uploads/pdf-826742921.pdf",
      courseId: "1",
      curriculumId: "1",
      gradeId: "1",
      slug: "math-24",
      createdAt: DateTime.now(),
      price: 600),
];
