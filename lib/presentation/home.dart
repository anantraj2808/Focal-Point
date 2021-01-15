import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focal_point/constants/colors.dart';
import 'package:focal_point/presentation/search_page.dart';
import 'package:focal_point/services/shared_preferences.dart';
import 'package:focal_point/services/shared_prefs_ready_state.dart';
import 'package:focal_point/services/user_authentication.dart';
import 'package:focal_point/styles/waiting_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomePage/View/home_screen.dart';
import 'ProfilePage/View/profile_page.dart';

class Home extends StatefulWidget {

  final bool isNewUser;
  Home({@required this.isNewUser});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool loading = false;

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
  void initState() {
    super.initState();
    setDetails();
  }

  void setDetails() async {
    setState(() {
      loading = true;
    });
    if(!widget.isNewUser){
      await setUserDetails(context, await SharedPrefs.getUserJWTSharedPrefs());
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Opacity(opacity: loading ? 0.3 : 1.0,
          child: PageView(
            children: _screens,
            controller: _pageController,
            onPageChanged: _onPageChanged,
            physics: NeverScrollableScrollPhysics(),
          ),),
          loading ? waitingObject() : Container()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              title: Text("Home", style: TextStyle(
                  color: _selectedIndex == 0 ? DARK_BLUE : Colors.grey
              ),),
              icon: Icon(Icons.home,color: _selectedIndex == 0 ? DARK_BLUE : Colors.grey,)),
          BottomNavigationBarItem(
              title: Text("Search", style: TextStyle(
                  color: _selectedIndex == 1 ? DARK_BLUE : Colors.grey
              ),),
              icon: Icon(Icons.search,color: _selectedIndex == 1 ? DARK_BLUE : Colors.grey)),
          BottomNavigationBarItem(
              title: Text("Profile", style: TextStyle(
                  color: _selectedIndex == 2 ? DARK_BLUE : Colors.grey
              ),),
              icon: Icon(Icons.person,color: _selectedIndex == 2 ? DARK_BLUE : Colors.grey)),
        ],
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
