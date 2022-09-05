import 'package:get/get.dart';
import 'package:globaltrailblazersapp/models/grade_model.dart';
import 'package:globaltrailblazersapp/services/database_service.dart';
import 'package:globaltrailblazersapp/shared/funcs.dart';

class GradeController extends GetxController {
  var currentUserGrade = Rx<Grade?>(null);

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
    if (result != ErrorException) {
      grades = result;
    }
  }
}
