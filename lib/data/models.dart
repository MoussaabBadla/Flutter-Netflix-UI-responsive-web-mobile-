import 'package:flutter/material.dart';

class Serie {
  final String name;
  final String imageUrl;
  final String? titleImageUrl;
  final String? des;
  final String? vidurl;
  final List<String>? categories;

  const Serie(
      {required this.name,
      required this.imageUrl,
      this.titleImageUrl,
      this.des,
      this.categories,
      this.vidurl });
}
