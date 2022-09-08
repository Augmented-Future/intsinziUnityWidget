import 'package:get/get.dart';
import 'package:globaltrailblazersapp/models/course_model.dart';
import 'package:globaltrailblazersapp/services/database_service.dart';

class CourseController extends GetxController with StateMixin<List<Course>> {
  var selectedCourse = Rx<Course?>(null);
  @override
  void onInit() {
    fetchCourses();
    super.onInit();
  }

  fetchCourses() async {
    try {
      String apiRoute = "/courses";
      RequestResponse result = await DatabaseService.createGetRequest(apiRoute);
      if (result.decoded == null) {
        change(
          null,
          status: RxStatus.error("[GET] Request failed. $apiRoute"),
        );
        return;
      }
      if (result.statusCode != 200) {
        change(
          null,
          status: RxStatus.error(result.decoded['message']),
        );
        return;
      }

      List<Course> courses = [];
      for (var i = 0; i < result.decoded['data']['rows'].length; i++) {
        courses.add(Course.fromJson(result.decoded['data']['rows'][i]));
      }

      if (courses.isEmpty) {
        change(null, status: RxStatus.empty());
        return;
      }
      selectedCourse.value = courses[0];
      change(courses, status: RxStatus.success());
    } catch (e) {
      change(
        null,
        status: RxStatus.error(e.toString()),
      );
      return;
    }
  }
}
