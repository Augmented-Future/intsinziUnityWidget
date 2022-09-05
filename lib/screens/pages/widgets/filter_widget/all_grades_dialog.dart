import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globaltrailblazersapp/controllers/refresh_controller.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/filter_widget/filter_list_dialog_widget.dart';
import 'package:globaltrailblazersapp/shared/funcs.dart';

import '../../../../models/grade_model.dart';
import '../../../../controllers/grade_controller.dart';

class AllGradesDialog extends StatefulWidget {
  const AllGradesDialog({
    Key? key,
    required this.gradeController,
  }) : super(key: key);

  final GradeController gradeController;

  @override
  State<AllGradesDialog> createState() => _AllGradesDialogState();
}

class _AllGradesDialogState extends State<AllGradesDialog> {
  late List<Grade> grades;
  late Grade currentGrade;
  final BorderRadius _radius = BorderRadius.circular(8);

  final refresh = Get.find<RefreshController>();
  @override
  void initState() {
    grades = widget.gradeController.grades;
    currentGrade = widget.gradeController.currentUserGrade.value!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0.0,
      shape: RoundedRectangleBorder(borderRadius: _radius),
      child: SizedBox(
        height: grades.length > 7
            ? screenHeight(context) * 0.4
            : 58.0 * grades.length,
        child: ListView.builder(
            itemCount: grades.length,
            itemBuilder: (context, index) {
              bool active = currentGrade.id == grades[index].id;
              return FilterDialogTile(
                  active: active,
                  isLast: index != grades.length - 1,
                  text: grades[index].name,
                  onClick: () {
                    Navigator.pop(context);
                    if (active) return;
                    widget.gradeController.currentUserGrade.value =
                        grades[index];
                    refresh.refreshPage();
                  });
            }),
      ),
    );
  }
}
