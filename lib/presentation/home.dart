import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focal_point/constants/colors.dart';
import 'package:focal_point/presentation/profile_page.dart';
import 'package:focal_point/presentation/search_page.dart';

import 'HomePage/View/home_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Widget> _screens = [
    HomePage(),
    SearchPage(),
    ProfilePage()
  ];
  PageController _pageController = PageController();

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  int _selectedIndex = 0;
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: _screens,
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              title: Text("Home", style: TextStyle(
                  color: _selectedIndex == 0 ? BLUE_GREY : Colors.grey
              ),),
              icon: Icon(Icons.home,color: _selectedIndex == 0 ? BLUE_GREY : Colors.grey,)),
          BottomNavigationBarItem(
              title: Text("Search", style: TextStyle(
                  color: _selectedIndex == 1 ? BLUE_GREY : Colors.grey
              ),),
              icon: Icon(Icons.search,color: _selectedIndex == 1 ? BLUE_GREY : Colors.grey)),
          BottomNavigationBarItem(
              title: Text("Profile", style: TextStyle(
                  color: _selectedIndex == 2 ? BLUE_GREY : Colors.grey
              ),),
              icon: Icon(Icons.person,color: _selectedIndex == 2 ? BLUE_GREY : Colors.grey)),
        ],
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
