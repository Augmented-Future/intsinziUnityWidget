class Content {
  int id;
  String name;
  Content({required this.id, required this.name});
}

class Course {
  int id;
  String courseCode;
  String name;
  Course({required this.id, required this.name, required this.courseCode});
}

class ProductType {
  int id;
  String name;
  ProductType({required this.id, required this.name});
}

class Grade {
  int id;
  String name;
  Grade({required this.id, required this.name});
}

//Contents
List<Content> contents = [
  Content(id: 1, name: "Animations"),
  Content(id: 2, name: "Cormics"),
  Content(id: 3, name: "Books"),
];

//Courses
List<Course> courses = [
  Course(id: 1, name: "Math", courseCode: "MAT116"),
  Course(id: 2, name: "Phy116", courseCode: "Phy116"),
  Course(id: 3, name: "Eng", courseCode: "Eng20"),
];

//Grades
List<Grade> grades = [
  Grade(id: 1, name: "Primary 3"),
  Grade(id: 2, name: "Primary 4"),
  Grade(id: 3, name: "Primary 5"),
];

//Product types
List<ProductType> productTypes = [
  ProductType(id: 1, name: "Printing"),
  ProductType(id: 2, name: "Deliver"),
  ProductType(id: 3, name: "Both"),
];

Content getContent(int id) {
  try {
    return contents.firstWhere((product) => (product.id == id));
  } catch (e) {
    return Content(id: id, name: "No select");
  }
}

Course getCourse(int id) {
  try {
    return courses.where((course) => (course.id == id)).toList().first;
  } catch (e) {
    return Course(id: id, name: "No select", courseCode: "No select");
  }
}

ProductType getProduct(int id) {
  try {
    return productTypes.where((product) => (product.id == id)).toList().first;
  } catch (e) {
    return ProductType(id: id, name: "No select");
  }
}

Grade getGrade(int id) {
  try {
    return grades.where((grade) => (grade.id == id)).toList().first;
  } catch (e) {
    return Grade(id: id, name: "No select");
  }
}
