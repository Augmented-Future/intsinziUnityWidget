class Book {
  Book({
    required this.pages,
    required this.id,
    required this.author,
    required this.cover,
    required this.price,
    required this.description,
    required this.title,
    required this.narration,
    required this.pdfUrl,
    required this.augmented,
    required this.level,
    required this.time,
    required this.updatedAt,
    required this.createdAt,
    required this.ageGroup,
    required this.numberOfPages,
  });
  List<dynamic> pages;
  int id;
  String author;
  String cover;
  String price;
  String description;
  String title;
  String narration;
  dynamic augmented; //The book which is augmented
  String pdfUrl;
  String level;
  String time;
  DateTime updatedAt;
  DateTime createdAt;
  dynamic ageGroup;
  int numberOfPages;
  static Book fromJson(Map<String, dynamic> json) => Book(
        pages: List<dynamic>.from(json["pages"].map((x) => x)),
        id: json["id"],
        author: json["author"],
        cover: json["cover"],
        price: json["price"],
        description: json["description"],
        title: json["title"],
        narration: json["narration"],
        augmented: json["augmented"],
        pdfUrl:
            "https://andonovicmilica.files.wordpress.com/2018/07/short-stories-for-children.pdf",
        level: json["level"],
        time: json["time"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
        ageGroup: json["ageGroup"],
        numberOfPages: json["numberOfPages"],
      );
}

List<Book> dummyBooks = [
  Book(
    pages: ["null", "null"],
    id: 1,
    author: "Augmented Future",
    cover:
        "https://cdn.pixabay.com/photo/2022/08/04/00/51/woman-7363571_1280.jpg",
    price: "500",
    description:
        "Dear students, this book is published to engage learning faster and clean.",
    title: "tThe ABS of Rwanda",
    narration: "null",
    augmented: "null",
    level: "Intermediate",
    time: "5 min",
    pdfUrl:
        "https://www.adobe.com/support/products/enterprise/knowledgecenter/media/c4611_sample_explain.pdf",
    updatedAt: DateTime.now(),
    createdAt: DateTime.now(),
    ageGroup: "5-12",
    numberOfPages: 4,
  ),
  Book(
    pages: ["null", "null"],
    id: 2,
    author: "ImagineWePub",
    cover:
        "https://cdn.shopify.com/s/files/1/2081/8163/products/My-Christmas-Adventure-new-1g_2048x.jpg?v=1607217884",
    price: "600",
    description: "An I hope you'll find this cool also yohoooooooo",
    title: "Hello world, children",
    narration: "null",
    augmented: "null",
    pdfUrl:
        "https://andonovicmilica.files.wordpress.com/2018/07/short-stories-for-children.pdf",
    level: "Advanced",
    time: "12 min",
    updatedAt: DateTime.now(),
    createdAt: DateTime.now(),
    ageGroup: "7-89",
    numberOfPages: 44,
  ),
];
