

import 'package:flutter/material.dart';

import '../../../shared/colors.dart';
import '../../../controllers/grade_controller.dart';

class AllGradesDialog extends StatelessWidget {
  const AllGradesDialog({
    Key? key,
    required this.gradeController,
  }) : super(key: key);

  final GradeController gradeController;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        height: 280,
        child: ListView.builder(
            itemCount: gradeController.grades.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    title: Center(
                        child: Text(
                      gradeController.grades[index].name,
                      style: const TextStyle(color: primaryColor),
                    )),
                    onTap: () {
                      gradeController.currentUserGrade.value =
                          gradeController.grades[index];
                      Navigator.pop(context);
                    },
                  ),
                  const Divider(
                    height: 0.0,
                  )
                ],
              );
            }),
      ),
    );
  }
}
