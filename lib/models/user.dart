import 'post.dart';
import 'package:flutter/material.dart';

class User {
  String username;
  List<Post> posts;
  AssetImage profilePicture;

  User(
    this.username,
    this.profilePicture,
    this.posts,
  );
}
