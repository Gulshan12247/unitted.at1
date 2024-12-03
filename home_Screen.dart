import 'package:flutter/material.dart';
import 'package:untitled/homePages/reelsScreen.dart';
import 'package:untitled/homePages/homeScreen.dart';
import 'package:untitled/homePages/postScreen.dart';
import 'package:untitled/homePages/profileScreen.dart';
import 'package:untitled/homePages/searchScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Define the widgets for each tab
  final List<Widget> _widgetOptions = <Widget>[
    Homepage(),
    search(),
    post(),
    Reels(),
    profile(),

    ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: _widgetOptions[_selectedIndex], // Show the selected widget
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add),
            label: "Post",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_call),
            label: "Reels",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),

        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // Call the method when a tab is tapped
      ),
    );
  }
}
