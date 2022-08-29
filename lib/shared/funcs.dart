import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:globaltrailblazersapp/shared/colors.dart';

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

enum IsLoading { loading, done, failed, error, none }

List months = [
  "Mon",
  "Feb",
  "Mar",
  "Apr",
  "May",
  "Jun",
  "Jul",
  "Aug",
  "Sep",
  "Oct",
  "Nov",
  "Dec"
];

showToast({required String message, bool? success}) {
  Fluttertoast.showToast(
    msg: message,
    textColor: whiteColor,
    backgroundColor: success == false ? color100 : coolGreen,
  );
}
