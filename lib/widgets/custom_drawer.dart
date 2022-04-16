// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:social_media_ui/data/data.dart';
import 'package:social_media_ui/screens/profile_screen.dart';

class CustomDrawer extends  StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: Column(

        children: [
          Container(
          height: 200,
          child: Stack(
            children:  [
              Image(
                  image: AssetImage(currentUser.backgroundImageUrl!,
                  ),
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,

              ),
              Positioned(
                bottom: 30,
                left: 20,

                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.blue,
                          width: 3,
                        )
                      ),
                      child: ClipOval(
                        child: Image(
                          height: 90,
                          width: 90,
                          image: AssetImage(
                            currentUser.profileImageUrl!,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 6.0),
                    Text(
                      currentUser.name!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            blurRadius: 20
                          )
                        ]
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          ),
          ListTile(
            title: Text('Home'),
            leading: Icon(Icons.home),
            onTap: (){},
          ),
          ListTile(
            title: Text('Profile'),
            leading: Icon(Icons.person),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => ProfileScreen(),)
              );
            },
          ),
          ListTile(
            title: Text('Chat'),
            leading: Icon(Icons.chat),
            onTap: (){},
          ),
          ListTile(
            title: Text('Map'),
            leading: Icon(Icons.location_on),
            onTap: (){},
          ),
          Expanded(

            child: Align(
              alignment: FractionalOffset.bottomLeft,
              child: ListTile(
                title: Text('LogOut'),
                leading: Icon(Icons.logout),
                onTap: (){},
              ),
            ),
          ),


        ],
      ),
    );
  }
}
