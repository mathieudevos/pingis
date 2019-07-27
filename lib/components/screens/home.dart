import 'package:flutter/material.dart';
import 'package:pingis/utils/constants.dart';
import 'intro.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final title = Constants.getTitle();

  int _bottomNavBarIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
    ),
    Text(
      'Index 1: Business',
    ),
    Text(
      'Index 2: School',
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
      appBar: AppBar(title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/pingpong-bw.png', fit: BoxFit.contain, height: 32, color: Colors.white),
          Container(padding: const EdgeInsets.all(8.0), child: Text(this.title, style: Theme.of(context).textTheme.title)),
        ]),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _widgetOptions.elementAt(_bottomNavBarIndex),
            RaisedButton(
              child: Icon(Icons.home),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => IntroScreen())),
            ),
          ]
        )),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(icon: Icon(Icons.hot_tub), title: Text('Hot tub')),
            BottomNavigationBarItem(icon: Icon(Icons.add), title: Text('Add')),
          ],
          currentIndex: _bottomNavBarIndex,
          selectedItemColor: Colors.redAccent,
          onTap: _bottomNavBarItemTapped,
        ),
    );
  }
}