// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:social_media_ui/data/data.dart';
import 'package:social_media_ui/widgets/custom_drawer.dart';
import 'package:social_media_ui/widgets/post_carousal.dart';

import '../widgets/folllowing_users.dart';

class HomeScreen extends  StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}




class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin{
TabController? _tabController;
PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _tabController=TabController(length: 2, vsync: this);
    _pageController=PageController(initialPage: 0, viewportFraction: .8);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.blue
        ),
        backgroundColor: Colors.white,
       title: const Text('FRENZY',
       style: TextStyle(
         letterSpacing: 5,
         fontWeight: FontWeight.bold,
         fontSize: 25,
         color: Colors.blue,
       ),
       ),
        bottom: TabBar(
          tabs: const [
            Tab(text: 'Trending'),
            Tab(text: 'Latest'),

          ],
          labelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 19,
            letterSpacing: 2,
          ),
          labelColor: Colors.blue,
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 19,
            letterSpacing: 2,
          ),
          unselectedLabelColor: Colors.blue[300],
          controller: _tabController,
        ),
      ),
      body: ListView(
        children: [
          const FollowingUsers(),
          PostCarousel(
            _pageController,
            posts,
            'Posts'
          ),
        ],
      ),
      drawer: CustomDrawer(),
    );
  }


}
