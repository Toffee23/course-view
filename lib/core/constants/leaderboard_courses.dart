import 'package:flutter/material.dart';

class Courses {
  final String image, title, abbrv, footnote;
  final Color color;

  Courses({
    required this.image,
    required this.title,
    required this.footnote,
    required this.abbrv,
    required this.color,
  });
}

List<Courses> courses = [
  Courses(
    title: "Institute Chartered Accountants of Nigeria",
    footnote: "26 Courses   6 Levels",
    abbrv: "ICAN",
    image: "assets/images/ICAN.png",
    color: Colors.indigo,
  ),
  Courses(
    title: "Association of Chartered Certified Accountants",
    footnote: "26 Courses   6 Levels",
    abbrv: "ACCA",
    image: "assets/images/ACCA_logo 1 4.png",
    color: Colors.orange,
  ),
  Courses(
    title: "Chartered Institute of Taxation of Nigeria",
    footnote: "26 Courses   6 Levels",
    abbrv: "CITN",
    image: "assets/images/CITN Logo 1 1.png",
    color: Colors.green,
  ),
  Courses(
    title: "Chartered Institute of Management Accountants",
    footnote: "26 Courses   6 Levels",
    abbrv: "CIMA",
    image: "assets/images/CIMA-Logo 2.png",
    color: Colors.purple,
  ),
  // Courses(
  //   title: "Chartered Institute of Stockbrokers of Nigeria",
  //   footnote: "26 Courses   6 Levels",
  //   abbrv: "CIS",
  //   image: "assets/images/CIS Logo 1 1.png",
  // ),
  // Courses(
  //   title: "Association of National Accountants of Nigeria ",
  //   footnote: "26 Courses   6 Levels",
  //   abbrv: "ANAN",
  //   image: "assets/images/ANAN 2.png",
  // ),
];
