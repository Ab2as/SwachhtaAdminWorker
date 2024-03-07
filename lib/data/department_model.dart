import 'package:flutter/material.dart';

class Department{
  const Department({
    required this.id,
    required this.title,
    this.color= Colors.orange
  });
  final String title;
  final String id;
  final Color color;
}