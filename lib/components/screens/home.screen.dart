import 'package:flutter/material.dart';
import 'package:pingis/components/pages/profile.page.dart';
import 'package:pingis/components/views/drawers/settings.drawer.dart';
import 'package:pingis/components/views/shared/applicationbar.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _bottomNavBarIndex = 0;
  static final List<Widget> _widgetOptions = [
    ProfilePage(),
    Text(
      'Index 1: Elo',
    ),
    Text(
      'Index 2: Teams',
    ),
    Text(
      'Index 3: Add',
    ),
  ];

  void _bottomNavBarItemTapped(int i) {
    setState(() {
      _bottomNavBarIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: ApplicationBar(),
      body: _widgetOptions.elementAt(_bottomNavBarIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Profile')),
          BottomNavigationBarItem(icon: Icon(Icons.trending_up), title: Text('Elo')),
          BottomNavigationBarItem(icon: Icon(Icons.whatshot), title: Text('Teams')),
          BottomNavigationBarItem(icon: Icon(Icons.add), title: Text('Add')),
        ],
        currentIndex: _bottomNavBarIndex,
        selectedItemColor: Colors.red[600],
        unselectedItemColor: Colors.grey,
        onTap: _bottomNavBarItemTapped,
      ),
      endDrawer: SettingsDrawer(),
    );
  }
}