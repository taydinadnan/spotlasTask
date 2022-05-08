import 'package:flutter/material.dart';
import 'package:spotlastask1/models/restaurant.dart';
import 'tags.dart';
import 'user.dart';
import 'post.dart';

TextStyle textStyle = const TextStyle(fontFamily: 'Gotham');
TextStyle textStyleBold = const TextStyle(
    fontFamily: 'Gotham', fontWeight: FontWeight.bold, color: Colors.black);
TextStyle textStyleLigthGrey =
    const TextStyle(fontFamily: 'Gotham', color: Colors.grey);

//USERS
final User user = User(
  'Adnan',
  const AssetImage('lib/assets/my_profile.jpg'),
  [],
);
User follower1 = User(
  'Turgay',
  const AssetImage('lib/assets/follower3.jpeg'),
  [],
);
User follower2 = User(
  'David',
  const AssetImage('lib/assets/follower2.jpeg'),
  [],
);
User follower3 = User(
  'Michelle',
  const AssetImage('lib/assets/their_profile.jpeg'),
  [],
);

//Restaurant Information
final Restaurant RestaurantUser = Restaurant(
  'Pachamama',
  const AssetImage('lib/assets/P.png'),
);

//USER POSTS
List<Post> userPosts = [
  Post(
    const AssetImage('lib/assets/photo_1.jpeg'),
    user,
    "The Best peruvian food in London. \nYou have to try Peruvian burger.",
    false,
    false,
  ),
  Post(
    const AssetImage('lib/assets/photo_1.jpeg'),
    follower1,
    "This is such a great post though",
    false,
    false,
  ),
  Post(
    const AssetImage('lib/assets/photo_1.jpeg'),
    follower2,
    "The Best peruvian food in London. \nYou have to try Peruvian burger.",
    false,
    false,
  ),
  Post(
    const AssetImage('lib/assets/photo_1.jpeg'),
    follower3,
    "The Best peruvian food in London. \nYou have to try Peruvian burger.",
    false,
    false,
  ),
];

//Suggested Tags
List<Tags> suggestedTags = [
  Tags(
    "Outdoors",
  ),
  Tags(
    "Cheap",
  ),
  Tags(
    "Live Music",
  ),
  Tags(
    "Romantic",
  ),
];
