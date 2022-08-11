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
  String augmented;
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
    pages: ["Hello", "World"],
    id: 234,
    author: "author",
    cover:
        "https://cdn.pixabay.com/photo/2022/08/04/00/51/woman-7363571_1280.jpg",
    price: "price",
    description: "description",
    title: "title",
    narration: "narration",
    augmented: "augmented",
    level: "level",
    time: "time",
    updatedAt: DateTime.now(),
    createdAt: DateTime.now(),
    ageGroup: "ageGroup",
    numberOfPages: 5,
  ),
  Book(
    pages: ["Hello", "World"],
    id: 234,
    author: "author",
    cover:
        "https://cdn.pixabay.com/photo/2022/08/04/00/51/woman-7363571_1280.jpg",
    price: "price",
    description: "description",
    title: "title",
    narration: "narration",
    augmented: "augmented",
    level: "level",
    time: "time",
    updatedAt: DateTime.now(),
    createdAt: DateTime.now(),
    ageGroup: "ageGroup",
    numberOfPages: 5,
  ),
];
