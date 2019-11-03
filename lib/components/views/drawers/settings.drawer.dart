import 'package:flutter/material.dart';
import 'package:pingis/state/services/auth.service.dart';

class SettingsDrawer extends StatefulWidget {
  _SettingsDrawerState createState() => _SettingsDrawerState();
}

class _SettingsDrawerState extends State<SettingsDrawer> {
  Widget build(BuildContext context) {
    return Drawer(
      child:
        Column(children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                ListTile(
                  title: const Text('Username'),
                ),
                Divider(),
              ],
            ),
          ),
          Container(
            child:
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      const Divider(),
                      ListTile(
                        leading: Icon(Icons.exit_to_app),
                        title: const Text('Logout'),
                        onTap: () {
                          AuthService().signOut(context);
                          Navigator.pushNamed(context, '/login');
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.info_outline),
                        title: const Text('About'),
                      ),
                    ],
                  )
                )
              )
          ),
        ],
      ),
    );
  }
}