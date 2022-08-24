import 'package:get/get.dart';
import 'package:globaltrailblazersapp/models/grade.dart';
import 'package:globaltrailblazersapp/services/database_service.dart';

class GradeController extends GetxController {
  var currentUserGrade =
      Rx<Grade>(noGrade);

  List<Grade> grades = RxList<Grade>([]);
  //Getting one grade
  gettingOneGrade(int _gradeId) async {
    dynamic result = await DatabaseService.fetchOneGrade(_gradeId);
    if (result != null) {
      currentUserGrade.value = result;
    }
  }

  //Getting all grades
  gettingAllGrades() async {
    dynamic result = await DatabaseService.fetchAllGrades();
    if (result != null) {
      grades = result;
    }
  }
}
