import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/screens/pages/animations/animations_page.dart';
import 'package:globaltrailblazersapp/screens/pages/books/audio_books.dart';
import 'package:globaltrailblazersapp/screens/pages/books/library_home_page.dart';
import 'package:globaltrailblazersapp/screens/pages/games/board_game.dart';
import 'package:globaltrailblazersapp/screens/pages/index.dart';
import 'package:globaltrailblazersapp/screens/pages/page_404.dart';
import 'package:globaltrailblazersapp/screens/pages/shopping/shopping_page.dart';

import '../screens/pages/books/digital_books.dart';

class AppPage {
  int pageId;
  String content;
  Widget page;
  AppPage({required this.pageId, required this.content, required this.page});
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

//Pages
List<AppPage> appPages = [
  AppPage(
    pageId: 0,
    content: "Animations",
    page: const AnimationsPageScreen(),
  ),
  AppPage(
    pageId: 1,
    content: "Shopping",
    page: const ShoppingPage(),
  ),
  AppPage(
    pageId: 2,
    content: "Library",
    page: const IndexPage(page: LibraryHomePage()),
  ),
  AppPage(
    pageId: 3,
    content: "Board Game",
    page: const IndexPage(page: BoardGame()),
  ),
  AppPage(
    pageId: 4,
    content: "Game Page",
    page: const IndexPage(page: BoardGame()),
  ),
  AppPage(pageId: 5, content: "Audio Books", page: const AudioBooksZone()),
  AppPage(pageId: 6, content: "Digital Books", page: const DigitalBooksZone()),
];

//Courses
List<Course> courses = [
  Course(id: 1, name: "Mathematics", courseCode: "MAT116"),
  Course(id: 2, name: "English", courseCode: "Phy116"),
  Course(id: 3, name: "Social Studies", courseCode: "SSC89"),
  Course(id: 4, name: "Kinyarwanda", courseCode: "Kiny201"),
  Course(id: 5, name: "Science", courseCode: "EST200"),
];

//Grades
List<Grade> grades = [
  Grade(id: 1, name: "Nursary 1"),
  Grade(id: 2, name: "Nursary 2"),
  Grade(id: 3, name: "Nursary 3"),
  Grade(id: 4, name: "Primary 1"),
  Grade(id: 5, name: "Primary 2"),
  Grade(id: 6, name: "Primary 3"),
  Grade(id: 7, name: "Primary 4"),
  Grade(id: 8, name: "Primary 5"),
  Grade(id: 9, name: "Primary 6"),
];

//Product types
List<ProductType> productTypes = [
  ProductType(id: 1, name: "Print"),
  ProductType(id: 2, name: "Deliver"),
  ProductType(id: 3, name: "Print/Deliver"),
];

AppPage getContent(int id) {
  try {
    return appPages.firstWhere((page) => (page.pageId == id));
  } catch (e) {
    return AppPage(
      pageId: id,
      content: "No Select",
      page: const Page404(message: "Page not found", error: "404"),
    );
  }
}

Course getCourse(int? id) {
  try {
    return courses.where((course) => (course.id == id)).toList().first;
  } catch (e) {
    return Course(id: id ?? 4, name: "No select", courseCode: "No select");
  }
}

ProductType getProductType(int? id) {
  try {
    return productTypes.where((product) => (product.id == id)).toList().first;
  } catch (e) {
    return ProductType(id: id ?? 1, name: "No select");
  }
}

Grade getGrade(int id) {
  try {
    return grades.where((grade) => (grade.id == id)).toList().first;
  } catch (e) {
    return Grade(id: id, name: "No select");
  }
}
