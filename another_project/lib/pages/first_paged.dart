import "package:another_project/pages/home_page.dart";
import "package:another_project/pages/profile_page.dart";
import "package:another_project/pages/settings_page.dart";
import "package:flutter/material.dart";

class firstpaged extends StatefulWidget {
  firstpaged({super.key});

  @override
  State<firstpaged> createState() => _firstpagedState();
}

class _firstpagedState extends State<firstpaged> {
  // this keeps track of the current page to display
  int _selectedIndex = 0;

  // This method update the new selected index
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _page = [
    HomaePage(),
    //profile_page
    ProfilePage(),
    //setting_page
    Settings_Page()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("1st Page"),
      ),
      body: _page[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
        ],
      ),
    );
  }
}
