// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:social_media_ui/data/data.dart';
import 'package:social_media_ui/models/post_model.dart';

import '../models/user_model.dart';

class FollowingUsers extends  StatelessWidget {
  const FollowingUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8),
          child: Text('Following:',
            style: TextStyle(
            fontSize: 20,
            letterSpacing: 3,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),),
        ),

        Container(
          height: 80,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 10.0),
            itemCount: users.length,
            scrollDirection:Axis.horizontal,
            itemBuilder:(context, index) {
              User user=users[index];
              return GestureDetector(
                onTap: (){},
                child: Container(
                  margin: EdgeInsets.all(10),
                      height: 60,
                      width: 60,
                  decoration: BoxDecoration(
                    boxShadow:[
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        offset: Offset(0,2),
                      )
                    ],
                    border: Border.all(
                      color: Colors.blue,
                      width: 2,
                    ),
                    shape: BoxShape.circle,

                  ),
                  child: ClipOval(
                    child: Image(
                      height: 60.0,
                      width: 60.0,
                      image: AssetImage(user.profileImageUrl!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            } ,),
        ),

      ],
    );
  }
}
