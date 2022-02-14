import 'package:flutter/material.dart';

class Teacher {
  final String name;
  final String subject;
  final String image;
  final String text;
  final bool recent;
  final Color color;

  Teacher(this.name, this.subject, this.image, this.text, this.recent,
      {required this.color});
}
