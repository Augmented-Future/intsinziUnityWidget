import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:globaltrailblazersapp/shared/colors.dart';

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

enum IsLoading { loading, done, failed, error, none }

enum ProcessResponse { success, fail }

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

class ErrorException {
  int statusCode;
  String errorMessage;
  String error;
  ErrorException(
      {required this.statusCode,
      required this.errorMessage,
      this.error = "Error Happened"});
}

ErrorException errorMethod(int statusCode, String message) {
  return ErrorException(statusCode: statusCode, errorMessage: message);
}

String formatTime(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final hours = twoDigits(duration.inHours);
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));
  return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
}
