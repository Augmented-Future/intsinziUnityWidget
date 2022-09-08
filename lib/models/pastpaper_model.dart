class PastPaper {
  PastPaper({
    required this.id,
    required this.cover,
    required this.name,
    required this.pdf,
    required this.courseId,
    required this.curriculumId,
    required this.gradeId,
    required this.slug,
    required this.year,
  });

  String id;
  String cover;
  String name;
  String pdf;
  String courseId;
  String curriculumId;
  String gradeId;
  String slug;
  String year;

  PastPaper fromJson(Map<String, dynamic> json) => PastPaper(
        id: json["id"],
        cover: json["cover"],
        name: json["name"],
        pdf: json["pdf"],
        courseId: json["courseId"],
        curriculumId: json["curriculumId"],
        gradeId: json["gradeId"],
        slug: json["slug"],
        year: json["year"],
      );
}

List<PastPaper> pastPapers = [
  PastPaper(
    id: "12",
    cover: "https://thumbs.dreamstime.com/b/print-146985740.jpg",
    name: "Mathematics",
    pdf: "https://api.intsinzi.app/uploads/pdf-826742921.pdf",
    courseId: "1",
    curriculumId: "1",
    gradeId: "1",
    slug: "math-24",
    year: "2022",
  ),
  PastPaper(
    id: "12",
    cover: "https://api.intsinzi.app/uploads/cover-139370015.png",
    name: "Mathematics",
    pdf: "https://api.intsinzi.app/uploads/pdf-826742921.pdf",
    courseId: "1",
    curriculumId: "1",
    gradeId: "1",
    slug: "math-24",
    year: "2022",
  ),
  PastPaper(
    id: "12",
    cover:
        "https://cdn.pixabay.com/photo/2021/11/26/10/41/bride-6825609_1280.jpg",
    name: "Mathematics",
    pdf: "https://api.intsinzi.app/uploads/pdf-826742921.pdf",
    courseId: "1",
    curriculumId: "1",
    gradeId: "1",
    slug: "math-24",
    year: "2022",
  ),
];
