// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../models/post_model.dart';

class PostCarousel extends  StatelessWidget {
  PageController? pageController;
  List<Post> posts;
  String title;
   PostCarousel(this.pageController,
      this.posts,
      this.title,
  {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8),
        child: Text('$title:',
        style: const TextStyle(
          fontSize: 20,
          letterSpacing: 3,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        )
          ,),
      ),
      Container(
        height: 400,
        child: PageView.builder(
          physics:const BouncingScrollPhysics() ,
            itemBuilder: (context, index) {

              return _buildPost(context , index);
            },
          scrollDirection: Axis.horizontal,
          controller: pageController,
          itemCount: posts.length,


        ),
      ),

    ],

    );
  }

   _buildPost(BuildContext context , index) {
    Post post =posts[index];

    return AnimatedBuilder(
      animation: pageController!,
      builder: (BuildContext context, Widget? widget) {
        double value = 1;
        if (pageController!.position.haveDimensions) {
          value = (pageController!.page! - index);
          value = (1 - (value.abs() * 0.25)).clamp(0.0, 1.0);

        }
        return Center(
          child: SizedBox(

            height: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: Stack(

children: [
  Container(
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(5,5),
          blurRadius: 5,
        )
      ],
      borderRadius: BorderRadius.circular(15),
    ),
    height: 400,
    width: 300,
    child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
      child: Image(
        image: AssetImage(post.imageUrl!),
        fit: BoxFit.cover,

      ),
    ),
  ),
  Positioned(
      left: 10,
      right: 10,
      bottom: 10,

      child: Container(
        height: 100.0,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15)
              ,bottomRight: Radius.circular(15)),
          color: Colors.white54,

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title!,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              post.location!,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 6.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    SizedBox(width: 6.0),
                    Text(
                      post.likes.toString(),
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.comment,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(width: 6.0),
                    Text(
                      post.comments.toString(),
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                )
              ],
            ),

          ],
        ),
      ),
  ),

],
      ),
    );
  }
}
