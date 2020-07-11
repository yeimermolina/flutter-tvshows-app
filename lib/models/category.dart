import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;

 // const means the properties of the object cannot be changed after being instantiated
  const Category({
    @required this.id,
    @required this.title,
    this.color = Colors.yellow,
  });
}
