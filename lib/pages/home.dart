import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insta_like_button/insta_like_button.dart';
import 'package:spotlastask1/models/post.dart';
import 'package:spotlastask1/widgets/tags.dart';

import '../models/global.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool descTextShowFlag = false;
  static int page = 1;

  @override
  Widget build(BuildContext context) {
    Map<int, Widget> pageview = {
      1: getMain(),
    };
    return pageview[page]!;
  }

//  MAIN PAGE
  Widget getMain() {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Feed", style: textStyleBold),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Column(
                children: getPosts(context),
              )
            ],
          )
        ],
      ),
    );
  }

// GET LIST POSTS
  List<Widget> getPosts(BuildContext context) {
    List<Widget> posts = [];
    int index = 0;
    for (Post post in userPosts) {
      posts.add(getPost(context, post, index));
      index++;
    }
    return posts;
  }

// GET POST
  Widget getPost(BuildContext context, Post post, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Stack(
          children: [
            //Post Image
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.58,
              width: MediaQuery.of(context).size.width,
              child: InstaLikeButton(
                image: post.image,
                iconColor: Colors.red,
                onChanged: () {
                  setState(() {
                    post.isLiked = !post.isLiked;
                  });
                },
              ),
            ),
            //Post Info
            Column(
              children: [
                //USER INFO AND POST OPTIONS
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 35, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: CircleAvatar(
                              radius: 32,
                              backgroundColor: Colors.red,
                              child: CircleAvatar(
                                backgroundImage: post.user.profilePicture,
                                radius: 30,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                post.user.username,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                post.user.username,
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      //Post Options
                      IconButton(
                        icon: const Icon(
                          Icons.more_horiz,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 280),
                //RESTORAN INFO AND ADD FAVORITE
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: CircleAvatar(
                              radius: 32,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                backgroundImage: RestaurantUser.profilePicture,
                                radius: 30,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                RestaurantUser.RestaurantName,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                RestaurantUser.RestaurantName,
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),

                      //ADD FAVORITE
                      IconButton(
                        icon: SvgPicture.asset(
                          post.isSaved
                              ? "lib/assets/Star.svg"
                              : "lib/assets/Star Border.svg",
                          height: 35,
                          color: post.isSaved ? Colors.yellow : Colors.white,
                        ),
                        onPressed: () {
                          setState(
                            () {
                              userPosts[index].isSaved =
                                  post.isSaved ? false : true;
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        //MAP, COMMENTS, LIKES, SHARE BUTTONS
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Stack(
                alignment: const Alignment(0, 0),
                children: <Widget>[
                  IconButton(
                    icon: SvgPicture.asset(
                      "lib/assets/Map.svg",
                    ),
                    color: Colors.white,
                    onPressed: () {},
                  )
                ],
              ),
              Stack(
                alignment: const Alignment(0, 0),
                children: <Widget>[
                  IconButton(
                    icon: SvgPicture.asset(
                      "lib/assets/Comment.svg",
                    ),
                    color: Colors.white,
                    onPressed: () {},
                  )
                ],
              ),
              Stack(
                alignment: const Alignment(0, 0),
                children: <Widget>[
                  IconButton(
                    icon: SvgPicture.asset(
                      post.isLiked
                          ? "lib/assets/Heart.svg"
                          : "lib/assets/Heart Border.svg",
                      height: 30,
                      color: post.isLiked ? Colors.red : Colors.black,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          userPosts[index].isLiked =
                              post.isLiked ? false : true;
                        },
                      );
                    },
                  )
                ],
              ),
              Stack(
                alignment: const Alignment(0, 0),
                children: <Widget>[
                  IconButton(
                    icon: SvgPicture.asset(
                      "lib/assets/Share.svg",
                      height: 30,
                    ),
                    color: Colors.white,
                    onPressed: () {},
                  )
                ],
              )
            ],
          ),
        ),
        // CAPTION
        Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 15, right: 10),
              child: Text(
                post.user.username,
                style: textStyleBold,
              ),
            ),
            Row(
              children: [
                Text(
                  post.description,
                  style: textStyle,
                  maxLines: descTextShowFlag ? 7 : 1,
                  textAlign: TextAlign.start,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      descTextShowFlag = !descTextShowFlag;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      descTextShowFlag
                          ? const Text(
                              " less...",
                              style: TextStyle(color: Colors.blue),
                            )
                          : const Text(" more...",
                              style: TextStyle(color: Colors.blue))
                    ],
                  ),
                )
              ],
            )
          ],
        ),
        const SizedBox(height: 10),
        //Display Tags
        TagsWidget(),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "4 days ago",
            style: TextStyle(
              color: Colors.grey.withOpacity(0.5),
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
