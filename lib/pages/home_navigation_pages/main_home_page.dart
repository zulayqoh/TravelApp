import 'package:flutter/material.dart';
import 'package:travel_app_sample/pages/home_navigation_pages/category_page.dart';
import 'package:travel_app_sample/pages/home_navigation_pages/favorite_page.dart';
import 'package:travel_app_sample/pages/home_navigation_pages/profile_page.dart';
import 'package:travel_app_sample/utils/app_colors.dart';

import 'home_page.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  List pages = [
    HomePage(),
    CategoryPage(),
    FavoritePage(),
    ProfilePage()
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.bottomNavigationBackgroundColor,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex ,
        elevation: 0 ,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: AppColors.appMainColor,
        unselectedItemColor: AppColors.appInactiveColor,
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.select_all), label: 'Category'),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark_add_outlined), label: 'Favorite'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outlined), label: 'Profile'),
      ],),
    );
  }
}
