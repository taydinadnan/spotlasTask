import 'package:flutter/material.dart';
import 'user.dart';

class Post {
  AssetImage image;
  String description;
  User user;
  bool isLiked;
  bool isSaved;

  Post(
    this.image,
    this.user,
    this.description,
    this.isLiked,
    this.isSaved,
  );
}
