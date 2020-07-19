import 'package:flutter/material.dart';

enum Audience{
  Children,
  AllPublic,
  Teenagers,
}

class Show {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> episodes;
  final List<String> cast;
  final Audience audience;
  final bool isOnNetflix;
  final bool isOnPrime;
  final bool isOnHbo;

  const Show({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.imageUrl,
    @required this.episodes,
    @required this.cast,
    this.audience = Audience.AllPublic,
    this.isOnNetflix = false,
    this.isOnPrime = false,
    this.isOnHbo = false,
  });
}
