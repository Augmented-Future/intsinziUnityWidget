import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';

class FunFact {
  int id;
  String text, badgeSvgIcon;
  int popularity;
  PriorityLevel priorityLevel;
  Color color;
  FunFact(
      {required this.id,
      required this.badgeSvgIcon,
      required this.popularity,
      required this.text,
      required this.priorityLevel,
      required this.color});
}

enum PriorityLevel { top, medium, low }

List<FunFact> funFacts = [
  FunFact(
      id: 1,
      badgeSvgIcon: 'assets/icons/aug.svg',
      popularity: 34,
      text: "No word in the dictionary ryhme with the word orange. ",
      priorityLevel: PriorityLevel.medium,
      color: const Color(0xFFF97316).withOpacity(0.8)),
  FunFact(
      id: 2,
      badgeSvgIcon: 'assets/icons/four.svg',
      popularity: 34,
      text: "Number four is the only one with the same amount of letters. ",
      priorityLevel: PriorityLevel.medium,
      color: const Color(0xFF77B6F1)),
  FunFact(
      id: 3,
      badgeSvgIcon: 'assets/icons/aug.svg',
      popularity: 34,
      text: "No word in the dictionary ryhme with the word orange. ",
      priorityLevel: PriorityLevel.medium,
      color: coolGreen),
];
