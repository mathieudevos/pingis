import 'package:flutter/material.dart';
import 'package:pingis/components/views/drawers/settings.drawer.dart';
import 'package:pingis/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int _bottomNavBarIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Profile',
    ),
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
      appBar: AppBar(title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          IconButton(
            icon: Image.asset(
              'assets/pingpong-bw.png',
              fit: BoxFit.contain,
              height: 32,
              color: Colors.white
            ),
            onPressed: () => _bottomNavBarItemTapped(0),
          ),
          FlatButton(
            padding: EdgeInsets.fromLTRB(2, 8, 8, 8),
            onPressed: () => _bottomNavBarItemTapped(0),
            child: Text(Constants.title, style: Theme.of(context).textTheme.title),
          ),
        ]),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
          )
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_bottomNavBarIndex),
      ),
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

// Column(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: <Widget>[
//     StreamBuilder(
//       stream: FirebaseAuth.instance.currentUser().asStream(),
//       builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
//         if (!snapshot.hasData) { return Text('Not logged in!'); }
//         return Text(snapshot.data.toString());
//       }
//     )
//   ]
// )),