import 'package:flutter/material.dart';
import 'package:whatsapp/screens/calls.dart';
import 'package:whatsapp/screens/communities.dart';
import 'package:whatsapp/screens/homePage.dart';
import 'package:whatsapp/screens/updates.dart'; // Import your screen files

class Bottomnavigation extends StatefulWidget {
  const Bottomnavigation({Key? key}) : super(key: key);

  @override
  State<Bottomnavigation> createState() => _BottomnavigationState();
}

class _BottomnavigationState extends State<Bottomnavigation> {
  int _currentIndex = 0;


  final List<Widget> _pages = [
    Homepage(),
    Updates(),
    Communities (),
    Calls(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black, // Background color of the BottomNavigationBar
        currentIndex: _currentIndex,  // Current selected index
        onTap: (index) {
          setState(() {
            _currentIndex = index;  // Update the index on tap
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
              size: 30,
              color: _currentIndex == 0 ? Colors.white : Colors.grey,
            ),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.change_circle_outlined,
              size: 30,
              color: _currentIndex == 1 ? Colors.white : Colors.grey,
            ),
            label: 'Updates',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.group,
              size: 30,
              color: _currentIndex == 1 ? Colors.white : Colors.grey,
            ),
            label: 'Communities',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.call,
              size: 30,
              color: _currentIndex == 2 ? Colors.white : Colors.grey,
            ),
            label: 'Calls',
          ),
        ],
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
