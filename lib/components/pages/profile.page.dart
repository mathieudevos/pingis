import 'package:flutter/material.dart';
import 'package:pingis/state/services/auth.service.dart';

class ProfilePage extends StatelessWidget {
  final user = AuthService().user;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: user.photoURL != ''
                ? CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(user.photoURL),
                )
                : CircleAvatar(
                  radius: 40,
                  child: Text(user.initials),
                ),
            ),
          ],
        ),
      ),
    );
  }
}