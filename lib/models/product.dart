class Product {
  int id;
  String productImage1;
  dynamic productImage2;
  dynamic productImage3;
  String productVideo;
  String product;
  String description;
  String name;
  String slug;
  int price;
  int priceToPrint;
  int priceToDeliver;
  int typeId;
  String ages;
  String grade;
  String course;
  DateTime createdAt;
  DateTime updatedAt;
  Product(
      {required this.id,
      required this.productImage1,
      required this.productImage2,
      required this.productImage3,
      required this.productVideo,
      required this.product,
      required this.description,
      required this.name,
      required this.slug,
      required this.price,
      required this.priceToPrint,
      required this.priceToDeliver,
      required this.ages,
      required this.grade,
      required this.course,
      required this.createdAt,
      required this.updatedAt,
      required this.typeId});
  static Product fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        productImage1: json["product_image1"],
        productImage2: json["product_image2"],
        productImage3: json["product_image3"],
        productVideo: json["product_video"],
        product: json["product"],
        name: json["name"],
        description: "Product description is now described as well,",
        slug: json["slug"],
        price: json["price"],
        priceToPrint: json["price_to_print"],
        priceToDeliver: json["price_to_deliver"],
        ages: json["ages"],
        grade: json["grade"],
        course: json["course"],
        typeId: 1,
        createdAt:
            DateTime.parse(json["createdAt"] ?? "2022-08-16T22:42:52.225Z"),
        updatedAt:
            DateTime.parse(json["updatedAt"] ?? "2022-08-16T22:42:52.225Z"),
      );
}

List<Product> productsList = [
  Product(
      id: 23,
      productImage1: "https://thumbs.dreamstime.com/b/print-146985740.jpg",
      productImage2:
          "https://cdn.pixabay.com/photo/2022/08/06/19/20/woman-7369219_1280.jpg",
      productImage3:
          "https://cdn.pixabay.com/photo/2015/07/09/00/29/woman-837156_1280.jpg",
      productVideo: "https://api.intsinzi.app/uploads/media-768163994.mp4",
      product: "Product description - Lorem ipsum text goes here. ",
      name: "Aimelive Pro",
      slug: "slug",
      price: 200,
      description: "Product description - Lorem ipsum text goes here.",
      priceToPrint: 500,
      priceToDeliver: 1000,
      ages: "9-17",
      grade: "p1-p6",
      course: "Mathematics",
      typeId: 2,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now()),
  Product(
      id: 24,
      productImage1: "https://thumbs.dreamstime.com/b/print-146985740.jpg",
      productImage2: "https://thumbs.dreamstime.com/b/print-146985740.jpg",
      productImage3: "https://thumbs.dreamstime.com/b/print-146985740.jpg",
      productVideo: "https://api.intsinzi.app/uploads/media-768163994.mp4",
      product: "Good man",
      name: "name",
      slug: "slug",
      description: "Product description - Lorem ipsum text goes here.",
      price: 200,
      priceToPrint: 500,
      priceToDeliver: 1000,
      ages: "9-17",
      grade: "p1-p6",
      course: "Mathematics",
      typeId: 3,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now())
];
